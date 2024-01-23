import 'dart:convert';
import 'dart:io';

import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/files_api/list_files.dart';
import 'package:blazedcloud/models/sync/folder_to_watch.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

Future<void> downloadFile(String fileKey, String uid, FolderToWatch folder,
    String token, String toPath) async {
  logger.d("Downloading file $fileKey");

  final response = await getFile(uid, fileKey, token);

  // Ensure the directory exists
  final directory = Directory(folder.folderPath);
  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }

  final file = File('$toPath.part');

  if (!await file.exists()) {
    await file.create(recursive: true);
  }
  final sink = file.openWrite();

  response.stream.listen((data) async {
    sink.add(data);
  }, onError: (error) {
    logger.e('Download error: $error');
    sink.flush().then((_) => sink.close());
  }, onDone: () {
    logger.i('Download complete');
    sink.flush().then((_) => sink.close());

    // rename the file
    file.renameSync(file.path.replaceAll(".part", ""));
  }, cancelOnError: true);
}

Future<void> downloadFolderTask(
    List<FileSystemEntity> localFiles,
    List<Contents> remoteFiles,
    String uid,
    FolderToWatch folder,
    String token) async {
  // clean failed downloads
  final failedDownloads =
      localFiles.where((file) => file.path.endsWith(".part")).toList();
  for (final file in failedDownloads) {
    logger.d("Cleaning failed download ${file.path}");
    file.deleteSync();
  }

  for (final file in remoteFiles) {
    if (file.key == null) {
      continue;
    }

    // check if the file is a directory
    logger.d("Checking if file is directory ${file.key}");
    if (file is Directory) {
      continue;
    }

    final path = '${folder.folderPath}/${getFilePathFromKey(file.key!, uid)}';
    final relativePath = path.replaceAll(folder.folderPath, '');
    logger.d("key: ${file.key} | Relative path: $relativePath | path: $path");

    // check if the file is already synced
    logger.d("Checking if file is synced");
    FileSystemEntity? lFile = localFiles
        .where((localFile) =>
            getRelativePath(localFile.path, folder.folderPath) == relativePath)
        .firstOrNull;
    if (lFile != null) {
      logger.d(
          "Local size: ${lFile.statSync().size} remote size: ${file.size} local same size: ${isLocalSizeSame(lFile, file)}");
      logger.d(
          "Local age: ${lFile.statSync().modified} remote age: ${DateTime.parse(file.lastModified ?? "1970-01-01")} local newer: ${isLocalNewer(lFile, file)}");
      continue;
    } else {
      logger.d("File is not synced - ${file.key}");
    }

    await downloadFile(file.key!, uid, folder, token, path);
  }
}

Future<List<FolderToWatch>> getFoldersForSync() async {
  var folders = List<FolderToWatch>.empty();

  // load from sharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final foldersToWatch = prefs.getStringList("foldersToWatch") ?? List.empty();

  // convert to FolderToWatch
  folders = foldersToWatch
      .map((folder) => FolderToWatch.fromJson(jsonDecode(folder)))
      .toList()
      .cast<FolderToWatch>();

  return folders;
}

String getRelativePath(String path, String folderPath) {
  return path.replaceAll(folderPath, '');
}

bool isLocalNewer(FileSystemEntity local, Contents remote) {
  // uses format 2024-01-21 19:24:19.000
  final localStat = local.statSync();

  // uses format 2024-01-22 01:02:04.720Z
  final remoteStat = DateTime.parse(remote.lastModified ?? "1970-01-01");

  return localStat.modified.isAfter(remoteStat);
}

bool isLocalSizeSame(FileSystemEntity local, Contents remote) {
  final localStat = local.statSync();
  final remoteStat = remote.size ?? 0;

  return localStat.size == remoteStat;
}

/// Syncs the folders with it's own upload code. Instead of using the upload controller class,
/// this function operates without user interaction and doesn't need redundant overhead
/// of communicating with the UI isolate
Future<bool> syncFolders(String uid, String token) async {
  final folders = await getFoldersForSync();

  for (final folder in folders) {
    // check if the folder is synced
    if (folder.isSynced()) {
      logger.d("Folder ${folder.folderName} is synced");
      continue;
    }

    // check if the folder can be accessed
    if (!folder.canAccess()) {
      logger.e("Folder ${folder.folderName} cannot be accessed");
      continue;
    }

    // get the files in the folder
    final localFiles = Directory(folder.folderPath).listSync();
    logger.d("Local files: ${localFiles.length} in ${folder.folderPath}");

    // get the files in the remote folder
    final remoteFiles =
        await getFilelistByFolder(uid, folder.remoteFolderKey, token)
            .then((value) => value.contents ?? List<Contents>.empty());
    logger.d("Remote files: ${remoteFiles.length} in ${folder.folderName}");

    switch (folder.mode) {
      case "download":
        await downloadFolderTask(localFiles, remoteFiles, uid, folder, token);
        break;
      case "upload":
        await uploadFolderTask(localFiles, remoteFiles, uid, folder, token);
        break;
    }
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
    existingWorkPolicy: ExistingWorkPolicy.replace, // TODO: change to keep
    //initialDelay: Duration(seconds: 10), TODO: uncomment
    backoffPolicy: BackoffPolicy.linear,
    inputData: {
      "uid": uid,
      "token": token,
    },
  );
}

Future<void> uploadFile(FileSystemEntity file, String uid, FolderToWatch folder,
    String name, String token, int size, String type) async {
  logger.d("Uploading file ${file.path}");

  // get upload url
  final url = await getUploadUrl(
      uid, folder.remoteFolderKey + name, token, size,
      contentType: type);
  logger.d("Upload url: $url");

  final dio = Dio();
  bytes() async* {
    yield* File(file.path).openRead();
  }

  final multipartFile = MultipartFile.fromStream(
    bytes,
    size,
    filename: name,
    contentType: MediaType.parse(type),
  );

  // upload the file
  final response = await dio.put(url,
      data: multipartFile.finalize(),
      options:
          Options(headers: {"Content-Type": type, "Content-Length": size}));

  logger.d("Upload response: ${response.statusCode}");
}

Future<void> uploadFolderTask(
    List<FileSystemEntity> localFiles,
    List<Contents> remoteFiles,
    String uid,
    FolderToWatch folder,
    String token) async {
  for (final file in localFiles) {
    // check if the file is a directory
    logger.d("Checking if file is directory ${file.path}");
    if (file is Directory) {
      continue;
    }

    final size = file.statSync().size;
    final name = file.path.split("/").last;
    final type = lookupMimeType(file.path) ?? 'application/octet-stream';

    // check if the file is already synced
    logger.d("Checking if file is synced");
    Contents? rFile = remoteFiles
        .where((rFile) => getFileName(rFile.key ?? '') == name)
        .firstOrNull;
    if (rFile != null) {
      logger.d(
          "Local size: ${file.statSync().size} remote size: ${rFile.size} local same size: ${isLocalSizeSame(file, rFile)}");
      logger.d(
          "Local age: ${file.statSync().modified} remote age: ${DateTime.parse(rFile.lastModified ?? "1970-01-01")} local newer: ${isLocalNewer(file, rFile)}");
      continue;
    } else {
      logger.d("File is not synced - ${file.path}");
    }

    await uploadFile(file, uid, folder, name, token, size, type);
  }
}
