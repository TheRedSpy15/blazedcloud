import 'dart:io';

import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/files_api/list_files.dart';
import 'package:blazedcloud/models/sync/folder_to_watch.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:workmanager/workmanager.dart';

Future<List<FolderToWatch>> getFoldersForSync() async {
  var folders = List<FolderToWatch>.empty();

  // load from sharedPreferences

  return folders;
}

Future<bool> syncFolders(String uid, String token) async {
  final folders = await getFoldersForSync();

  for (final folder in folders) {
    // check if the folder is synced
    if (folder.isSynced()) {
      continue;
    }

    // check if the folder can be accessed
    if (!folder.canAccess()) {
      continue;
    }

    // get the files in the folder
    final files = Directory(folder.folderPath).listSync();

    // get the files in the remote folder
    final remoteFiles = await getFilelistByFolder(uid, folder.folderName, token)
        .then((value) => value.contents ?? List<Contents>.empty());

    // get differences
    final notDownloaded = files
        .where((file) => !remoteFiles.any((remoteFile) =>
            remoteFile.key?.split("/").last == file.path.split("/").last))
        .toList();
    final notUploaded = remoteFiles
        .where((remoteFile) => !files.any((file) =>
            remoteFile.key?.split("/").last == file.path.split("/").last))
        .toList();
  }

  return true;
}

void updateSyncWorker(String uid, String token, bool allowMetered,
    bool requireCharging, int syncFrequency, bool isWatching) {
  if (!isWatching) {
    Workmanager().cancelByUniqueName("folderSync");
    return;
  }

  Workmanager().registerPeriodicTask(
    "folderSync",
    "folderSync",
    frequency: Duration(minutes: syncFrequency),
    constraints: Constraints(
      networkType:
          allowMetered ? NetworkType.connected : NetworkType.not_required,
      requiresBatteryNotLow: true,
      requiresCharging: requireCharging,
      requiresDeviceIdle: false,
      requiresStorageNotLow: true,
    ),
    backoffPolicy: BackoffPolicy.linear,
    initialDelay: const Duration(seconds: 10),
    inputData: {
      "uid": uid,
      "token": token,
    },
  );
}
