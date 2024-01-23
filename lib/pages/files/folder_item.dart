import 'dart:convert';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/controllers/download_controller.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/files_api/list_files.dart';
import 'package:blazedcloud/models/sync/folder_to_watch.dart';
import 'package:blazedcloud/pages/dashboard.dart';
import 'package:blazedcloud/pages/sync/folder_picker_dialog.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:blazedcloud/providers/sync_providers.dart';
import 'package:blazedcloud/providers/transfers_providers.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void delete(String folderKey, BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(S.of(context).deleteFolder),
      content:
          Text(S.of(context).confirmFolderDelete(getFolderName(folderKey))),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            // Handle delete action here
            logger.i('Deleting $folderKey');
            Navigator.of(context).pop();
            deleteFolder(pb.authStore.model.id, folderKey, pb.authStore.token)
                .then((_) {
              ref.invalidate(fileListProvider(getParentDirectory(folderKey)));
            });
          },
          child: Text(S.of(context).delete),
        ),
      ],
    ),
  );
}

void downloadFolder(String folderKey, ListBucketResult list,
    DownloadController downloadController, BuildContext context) {
  logger.d(
      'test Saving $folderKey \n with $list \n size ${list.contents?.length}');
  checkIfAccessToDownloadDirectoryIsGranted().then((granted) {
    if (!granted) {
      promptForDownloadDirectory(context);
    } else if (granted) {
      logger.i('Downloading $folderKey');
      getKeysInFolder(list, folderKey, true).forEach((fileKey) {
        logger.i('Downloading $fileKey from $folderKey');
        downloadController.queueDownload(pb.authStore.model.id, fileKey);
      });
      HapticFeedback.vibrate();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Downloading all files from ${getFolderName(folderKey)}',
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  });
}

class FolderItem extends ConsumerWidget {
  final String folderKey;

  const FolderItem({
    super.key,
    required this.folderKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadController = ref.watch(downloadControllerProvider);

    return InkWell(
      child: ListTile(
        leading: const Icon(Icons.folder),
        title: Text(
          getFolderName(folderKey),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: PopupMenuButton<String>(
          itemBuilder: (context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'save',
              child: Text(S.of(context).save),
            ),
            const PopupMenuItem<String>(
              value: 'addWatch',
              child: Text("Add Sync Rule"),
            ),
            PopupMenuItem<String>(
              value: 'delete',
              child: Text(S.of(context).delete),
            ),
          ],
          onSelected: (value) {
            if (value == 'save') {
              ref.read(fileListProvider(folderKey)).whenData((list) {
                logger.d(
                    'test Saving $folderKey \n with $list \n size ${list.contents?.length}');
                downloadFolder(folderKey, list, downloadController, context);
              });
            } else if (value == 'delete') {
              delete(folderKey, context, ref);
            } else if (value == 'addWatch') {
              createFolderWatchDown(context, ref);
            }
          },
        ),
      ),
      onTapDown: (details) {
        // change the current directory to the folder name
        ref.read(currentDirectoryProvider.notifier).state =
            '${ref.read(currentDirectoryProvider.notifier).state}${getFolderName(folderKey)}/';
        ref.invalidate(fileListProvider(ref.read(currentDirectoryProvider)));
      },
    );
  }

  void createFolderWatchDown(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Sync Rule"),
        content: const FolderWatchPickerDialogContent(),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () {
                // TODO: get required permissions to access files
                Navigator.of(context).pop();

                FilePicker.platform.getDirectoryPath().then((path) {
                  logger.d("Selected path: $path");
                  if (path == null) {
                    logger.e("No path selected");
                    return;
                  }

                  // verify that the folder exists
                  //if (!Directory(path).existsSync()) {
                  //  logger.e("Folder does not exist");
                  //  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //      content:
                  //          Text("The folder you selected does not exist")));
                  //  return;
                  //}

                  //ScaffoldMessenger.of(context).showSnackBar(
                  //    const SnackBar(content: Text("Folder added")));
                  logger.i("Adding folder $path to watch list");

                  // add the folder to the list
                  final folder = FolderToWatch(
                      folderName: getFolderName(folderKey).trim(),
                      folderPath: path,
                      remoteFolderKey: folderKey,
                      lastSynced: null,
                      mode: ref.read(newMode));
                  ref.read(foldersToWatchProvider.notifier).state = [
                    ...ref.read(foldersToWatchProvider),
                    folder
                  ];
                  logger.d("Added folder $folder");

                  // navigate to the sync page
                  ref.read(currentPageIndexProvider.notifier).state =
                      syncPageIndex;
                  logger.d("Navigated to sync page");

                  // save the folder to shared preferences
                  SharedPreferences.getInstance().then((prefs) {
                    final folders = ref.read(foldersToWatchProvider);
                    prefs.setStringList(
                        "foldersToWatch",
                        folders
                            .map((folder) => jsonEncode(folder.toJson()))
                            .toList()
                            .cast<String>());
                    logger.d("Saved folders to watch");
                  });
                });
              },
              child: const Text("Select Folder"))
        ],
      ),
    );
  }
}
