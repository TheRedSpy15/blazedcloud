import 'dart:io';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/files_api/list_files.dart';
import 'package:blazedcloud/providers/sync_providers.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

final dio = Dio()
  ..interceptors.add(LogInterceptor())
  ..httpClientAdapter = Http2Adapter(
    ConnectionManager(idleTimeout: const Duration(seconds: 10)),
  );

/// prompts for needed permissions, returns true if the user has granted all permissions, false otherwise
Future<bool> getSyncPermissions() async {
  if (!await Permission.photos.isGranted) {
    if (!await Permission.photos.request().isGranted) {
      return false;
    }
  }
  if (!await Permission.videos.isGranted) {
    if (!await Permission.videos.request().isGranted) {
      return false;
    }
  }

  return true;
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
  if (uid.isEmpty || token.isEmpty) {
    logger.e("UID or token is empty");
    return false;
  }
  if (!await Permission.videos.isGranted ||
      !await Permission.photos.isGranted) {
    logger.e("Permissions not granted");
    return false;
  }

  final syncedKeys = await getCameraSyncList(uid, token);
  logger.d("Synced keys: $syncedKeys");

  Directory folder = await SharedPreferences.getInstance().then((prefs) {
    return Directory(prefs.getString("cameraFolder") ?? "");
  });
  if (folder.path.isEmpty) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove("cameraFolder");
    });
    Workmanager().cancelByUniqueName("folderSync");
    return false;
  }

  // check if the folder can be accessed
  if (!folder.existsSync()) {
    Workmanager().cancelByUniqueName("folderSync");
    logger.e("Folder ${folder.path} cannot be accessed");
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove("cameraFolder");
    });
    return false;
  }

  // get the files in the folder
  List<FileSystemEntity> localFiles = folder.listSync();
  logger.d("Local files: ${localFiles.length} in ${folder.path}");

  // filter out files that are already synced by checking the last part of the path/key
  localFiles.removeWhere((element) {
    final key = element.path.split("/").last;
    logger.d("Checking key: $key");
    return syncedKeys.contains(key);
  });

  // get total size of files to upload
  final totalSize = localFiles.fold<int>(0, (previousValue, element) {
    if (element is File) {
      return previousValue + element.statSync().size;
    }
    return previousValue;
  });

  logger.d(
      "Unsynced files: ${localFiles.length} in ${folder.path} with total size: $totalSize bytes");

  try {
    await uploadFolderTask(localFiles, uid, token);
  } catch (e) {
    logger.e("Error uploading files: $e");
    return false;
  }

  await SharedPreferences.getInstance().then((prefs) {
    prefs.setString("lastCameraSync", DateTime.now().toIso8601String());
  });
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
    //frequency: Duration(minutes: syncFrequency),
    frequency: const Duration(hours: 6),
    constraints: Constraints(
      networkType: allowMetered ? NetworkType.connected : NetworkType.unmetered,
      requiresBatteryNotLow: true,
      requiresCharging: requireCharging,
      //requiresDeviceIdle: true,
      requiresStorageNotLow: false,
    ),
    existingWorkPolicy: ExistingWorkPolicy.replace,
    initialDelay: const Duration(minutes: 1),
    backoffPolicy: BackoffPolicy.exponential,
    inputData: {
      "uid": uid,
      "token": token,
    },
  );
}

void updateSyncWorkerWithRef(WidgetRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool("syncEnabled") == false) {
    Workmanager().cancelByUniqueName("folderSync");
    return;
  }

  if (!ref.read(watchEnabledProvider)) {
    Workmanager().cancelByUniqueName("folderSync");
    return;
  }

  Workmanager().registerPeriodicTask(
    "folderSync",
    "folderSync",
    //frequency: Duration(minutes: ref.read(syncFrequencyProvider)),
    frequency: const Duration(hours: 6),
    constraints: Constraints(
      networkType: ref.read(allowMeteredProvider)
          ? NetworkType.connected
          : NetworkType.unmetered,
      requiresBatteryNotLow: true,
      requiresCharging: ref.read(requireChargingProvider),
      //requiresDeviceIdle: true,
      requiresStorageNotLow: false,
    ),
    existingWorkPolicy: ExistingWorkPolicy.replace,
    initialDelay: const Duration(minutes: 5),
    backoffPolicy: BackoffPolicy.exponential,
    inputData: {
      "uid": pb.authStore.model.id,
      "token": pb.authStore.token,
    },
  );
}

Future<void> uploadFile(File file, String uid, String name, String token,
    int size, String type) async {
  logger.d("Uploading file ${file.path}");

  // add .part to the file name
  name = "$name.part";

  // get upload url
  final url = await getUploadUrl(uid, "$uid/camera-backup/$name", token, size,
      contentType: type);
  logger.d("Upload url: $url");

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

  // change the file name to remove the .part
  final newKey = name.replaceAll(".part", "");
  await changeObjectKey(
      uid, "$uid/camera-backup/$name", "$uid/camera-backup/$newKey", token);
}

Future<void> uploadFolderTask(
    List<FileSystemEntity> localFiles, String uid, String token) async {
  for (final file in localFiles) {
    if (file is! File) {
      continue;
    }
    final size = file.statSync().size;
    final name = file.path.split("/").last;
    final type = lookupMimeType(file.path) ?? 'application/octet-stream';

    await uploadFile(file, uid, name, token, size, type);

    // sleep for a bit to avoid rate limiting
    await Future.delayed(const Duration(seconds: 1));
  }
}
