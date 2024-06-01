import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/files_api/search_delagate.dart';
import 'package:blazedcloud/pages/files/file_item.dart';
import 'package:blazedcloud/pages/files/folder_item.dart';
import 'package:blazedcloud/providers/files_providers.dart';
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
    final currentDirectory = ref.watch(currentDirectoryProvider);
    final objectList = ref.watch(fileListProvider(currentDirectory));

    return BackButtonListener(
      onBackButtonPressed: () {
        if (ref.read(currentDirectoryProvider) == getStartingDirectory()) {
          return Future.value(false);
        } else {
          backOutOfCurrentFolder(ref);
          return Future.value(true);
        }
      },
      child: Scaffold(
          appBar: AppBar(
              title:
                  ref.watch(currentDirectoryProvider) != getStartingDirectory()
                      ? Text(ref
                          .watch(currentDirectoryProvider)
                          .split("/")
                          .lastWhere((element) => element.isNotEmpty))
                      : Text(S.of(context).blazedExplorer),

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
                    ref.read(searchKeysProvider.future).then((keys) =>
                        showSearch(
                            context: context,
                            delegate: FileSearchDelegate(keys)));
                  },
                  icon: const Icon(Icons.search),
                )
              ]),
          body: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(fileListProvider(currentDirectory));
              await ref.read(fileListProvider(currentDirectory).future);
            },
            child: objectList.when(
              data: (data) {
                final folders = data.commonPrefixes ?? [];
                final files = data.contents ?? [];
                if (folders.isEmpty && files.isEmpty) {
                  return Center(
                    child: Text(S.of(context).emptyDirectory),
                  );
                }

                return ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: folders.length + files.length,
                  separatorBuilder: (context, index) => const Divider(),
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
                      String uploaded = files[fileIndex].lastModified ?? "";
                      if (fileKey.contains(".blazed-placeholder")) {
                        return const SizedBox.shrink();
                      }
                      if (fileKey.endsWith(".part")) {
                        return const SizedBox.shrink();
                      }
                      return FileItem(
                        fileKey: fileKey,
                        size: fileSize,
                        uploaded: uploaded,
                      );
                    }
                  },
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (err, stack) {
                logger.e("Error loading file list: $err");
                return Center(
                  child: Text(S.of(context).errorErr(err.toString())),
                );
              },
            ),
          )),
    );
  }
}
