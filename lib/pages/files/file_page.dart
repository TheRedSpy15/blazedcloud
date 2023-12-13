import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/files_api/search_delagate.dart';
import 'package:blazedcloud/pages/files/file_item.dart';
import 'package:blazedcloud/pages/files/folder_item.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:blazedcloud/providers/transfers_providers.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newFolderNameProvider = StateProvider<String>((ref) => "");

class FilesPage extends ConsumerWidget {
  const FilesPage({super.key});

  void backOutOfCurrentFolder(WidgetRef ref) {
    ref.read(currentDirectoryProvider.notifier).state =
        getParentDirectory(ref.read(currentDirectoryProvider));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadController = ref.watch(uploadControllerProvider);
    final currentDirectory = ref.watch(currentDirectoryProvider);
    final objectList = ref.watch(fileListProvider(currentDirectory));

    return PopScope(
      onPopInvoked: (canPop) {
        if (!canPop) backOutOfCurrentFolder(ref);
      },
      canPop: ref.read(currentDirectoryProvider) == getStartingDirectory(),
      child: Scaffold(
        appBar: AppBar(
            title: ref.watch(currentDirectoryProvider) != getStartingDirectory()
                ? Text(ref
                    .watch(currentDirectoryProvider)
                    .split("/")
                    .lastWhere((element) => element.isNotEmpty))
                : const Text('Blazed Explorer'),

            // if current directory isn't root, show a back button
            leading:
                ref.watch(currentDirectoryProvider) != getStartingDirectory()
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          backOutOfCurrentFolder(ref);
                        },
                      )
                    : null,
            actions: [
              IconButton(
                onPressed: () {
                  ref.read(searchKeysProvider.future).then((keys) => showSearch(
                      context: context, delegate: FileSearchDelegate(keys)));
                },
                icon: const Icon(Icons.search),
              )
            ]),
        body: objectList.when(
          data: (data) {
            final folders = data.commonPrefixes ?? [];
            final files = data.contents ?? [];
            if (data.contents?.isEmpty ?? true) {
              return const Center(
                child: Text("No files or folders"),
              );
            }

            return Stack(children: [
              RefreshIndicator(
                onRefresh: () async {
                  // Invalidate by refreshing the FutureProvider
                  ref.invalidate(fileListProvider(currentDirectory));

                  // Wait for the new data to load
                  await ref.read(fileListProvider(currentDirectory).future);
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: folders.length + files.length,
                  itemBuilder: (context, index) {
                    if (index < folders.length) {
                      // Render folder items
                      String folderKey = folders[index].prefix ?? "";

                      if ("$folderKey/" != currentDirectory &&
                          isKeyInDirectory(folderKey, true, currentDirectory)) {
                        return FolderItem(
                          folderKey: folderKey,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    } else {
                      // Render file items
                      int fileIndex = index - folders.length;
                      String fileKey = files[fileIndex].key ?? "";
                      int fileSize = files[fileIndex].size ?? 0;
                      if (fileKey.contains(".blazed-placeholder")) {
                        return const SizedBox.shrink();
                      }
                      return FileItem(
                        fileKey: fileKey,
                        expectedSize: fileSize,
                      );
                    }
                  },
                ),
              ),
            ]);
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          error: (err, stack) {
            logger.e("Error loading file list: $err");
            return Center(
              child: Text("Error: $err"),
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              key: const Key("newFolderButton"),
              heroTag: "newFolderButton",
              onPressed: () {
                // show dialog to create a new folder
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Create folder'),
                    content: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Folder name',
                      ),
                      onChanged: (value) {
                        ref.read(newFolderNameProvider.notifier).state = value;
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // create new folder key by combining current directory and new folder name
                          final String newFolderKey =
                              "${ref.read(currentDirectoryProvider.notifier).state}${ref.read(newFolderNameProvider.notifier).state}";
                          logger.i(
                              'Creating folder ${ref.read(newFolderNameProvider.notifier).state}');
                          createFolder(newFolderKey).then((success) {
                            ref.invalidate(fileListProvider(currentDirectory));
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Created folder ${ref.read(newFolderNameProvider.notifier).state}'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Error creating folder ${ref.read(newFolderNameProvider.notifier).state}'),
                                ),
                              );
                            }
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Create'),
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(Icons.create_new_folder),
            ),
            const SizedBox(width: 16),
            ref.watch(combinedDataProvider(pb.authStore.model.id)).when(
                data: (data) {
                  final usageGB =
                      (data['usage'] / 1000000000).truncateToDouble();

                  if (usageGB >= data['capacity']) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'You have reached your storage limit. Please upgrade your storage.'),
                      ),
                    );
                    return const SizedBox.shrink();
                  } else {
                    return FloatingActionButton(
                        key: const Key("uploadButton"),
                        heroTag: "uploadButton",
                        onPressed: () {
                          uploadController.selectFilesToUpload(
                              ref.read(currentDirectoryProvider));
                        },
                        child: const Icon(Icons.file_upload));
                  }
                },
                loading: () => const SizedBox.shrink(),
                error: (err, stack) {
                  logger.e("Error loading file list: $err");
                  return const SizedBox.shrink();
                })
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
