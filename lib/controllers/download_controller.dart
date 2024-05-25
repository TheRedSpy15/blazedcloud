import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/transfers/download_state.dart';
import 'package:blazedcloud/providers/transfers_providers.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:blazedcloud/services/notifications.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

class DownloadController {
  final ProviderRef<DownloadController> _ref;

  DownloadController(this._ref) {
    final port = _ref.read(downloadReceivePortProvider);
    IsolateNameServer.registerPortWithName(port.sendPort, "downloader");
    port.listen((dynamic data) async {
      try {
        final downloadState = DownloadState.fromJson(jsonDecode(data));

        final downloadNotifier = _ref.read(downloadStateProvider.notifier);

        downloadNotifier.updateDownloadStateByKey(
            downloadState.downloadKey, downloadState);

        if (!isRequestingNotificationPermission) {
          updateDownloadNotification();
        }
      } catch (error) {
        logger.e('Error updating download state: $error');
      }
    });
  }

  /// start a download with workmanager
  void queueDownload(String uid, String fileKey) async {
    getOfflineFile(fileKey, pb.authStore.model.id).then((value) {
      if (value.existsSync()) {
        logger.i('File already exists: ${value.path}');
        return false;
      }
    });

    // UID, exportDir, token are passed to the worker directly so they can be replaced if needed
    final exportDir = await getExportDirectoryFromPrefs();
    if (isMobile) {
      addDownloadToOfflineQueue(fileKey);
      Workmanager().registerOneOffTask("download-task", "download-task",
          constraints: Constraints(
              networkType: NetworkType.connected, requiresStorageNotLow: true),
          tag: fileKey,
          backoffPolicy: BackoffPolicy.exponential,
          outOfQuotaPolicy: OutOfQuotaPolicy.run_as_non_expedited_work_request,
          existingWorkPolicy: ExistingWorkPolicy.replace,
          inputData: {
            "uid": uid,
            "exportDir": exportDir,
            "token": pb.authStore.token,
            "fileKey": fileKey,
          });
    } else {
      // don't use workmanager on desktop, just simple isolates
      final token = RootIsolateToken.instance;
      final auth = pb.authStore.token;
      if (token == null) {
        logger.e('RootIsolateToken is null');
        return;
      }
      BackgroundIsolateBinaryMessenger.ensureInitialized(token);
      logger.i('Starting download directly. token: ${pb.authStore.token}');
      Isolate.run(() => startDownloadDirectly(uid, auth, exportDir, fileKey));
    }
  }

  void updateDownloadNotification() {
    if (!isMobile) return;

    isRequestingNotificationPermission = true;
    NotificationService().initNotification().then((_) {
      NotificationService().showDownloadNotification(_ref
          .read(downloadStateProvider)
          .where((element) => element.isDownloading && !element.isError)
          .length);
      isRequestingNotificationPermission = false;
    });
  }

  static void addDownloadToOfflineQueue(String fileKey) {
    SharedPreferences.getInstance().then((prefs) {
      final offlineQueue = prefs.getStringList('offlineQueue') ?? [];
      offlineQueue.add(jsonEncode({
        'fileKey': fileKey,
        'date': DateTime.now().millisecondsSinceEpoch,
      }));
      prefs.setStringList('offlineQueue', offlineQueue);
      logger.i('Added download to offline queue: $fileKey ($offlineQueue)');
    });
  }

  static Future<DownloadItem?> getOldestPlannedDownload() async {
    List<String> offlineQueue = [];
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();
      offlineQueue = prefs.getStringList('offlineQueue') ?? [];
    } catch (error) {
      logger.e('Error getting SharedPreferences: $error');
    }

    if (offlineQueue.isEmpty) {
      logger.i('No planned downloads');
      return null;
    }
    logger.i('Planned downloads: $offlineQueue');

    final oldest = offlineQueue
        .map((e) => jsonDecode(e))
        .cast<Map<String, dynamic>>()
        .toList()
      ..sort((a, b) => a['date'].compareTo(b['date']));
    logger.i('Oldest planned download: ${oldest.first}');
    return DownloadItem(oldest.first['fileKey'], oldest.first['date']);
  }

  static Future<bool> isDownloadsRemaining() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final offlineQueue = prefs.getStringList('offlineQueue') ?? [];
    return offlineQueue.isNotEmpty;
  }

  static void removePlannedDownload(String fileKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final offlineQueue = prefs.getStringList('offlineQueue') ?? [];
    final newQueue = offlineQueue
        .where((element) => jsonDecode(element)['fileKey'] != fileKey)
        .toList();
    prefs.setStringList('offlineQueue', newQueue);
  }

  /// downloads a file directly without using workmanager while communicating with the main isolate.
  /// Used on desktop where workmanager is not available.
  static Future<bool> startDownloadDirectly(
      String uid, String token, String appDocDir, String fileKey) async {
    logger.i('Starting download directly. Token: $token');
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloader");
    final filePath =
        '$appDocDir/${getFilePathFromKey(fileKey, uid)}'; // Define the file path

    if (!Directory(appDocDir).existsSync()) {
      logger.e('Could not get appDocDir');
      return false;
    }

    final downloadState = DownloadState.inProgress(fileKey);
    final completer = Completer<bool>();
    try {
      // Ensure the directory exists
      final directory = Directory(appDocDir);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      // Initialize progress to 0
      double progress = 0.0;

      final file = File('$filePath.part');

      if (!await file.exists()) {
        await file.create(recursive: true);
      }
      final sink = file.openWrite();

      const Duration rateLimit =
          Duration(milliseconds: 300); // Adjust the duration as needed
      DateTime lastDataSentTime = DateTime.now();

      final response = await getFile(uid, fileKey, token);
      response.stream.listen((data) async {
        final totalBytes = response.contentLength ?? 0;
        progress += data.length / totalBytes;
        downloadState.updateProgress(progress);

        sink.add(data);

        // The port might be null if the main isolate is not running.
        if (sendPort != null) {
          // rate limit to prevent spamming the main isolate
          if (DateTime.now().difference(lastDataSentTime) >= rateLimit) {
            try {
              sendPort!.send(jsonEncode(downloadState.toJson()));
            } catch (error) {
              logger.e('send port error ($fileKey): $error');
            }
            lastDataSentTime = DateTime.now();
          }
        } else {
          sendPort = IsolateNameServer.lookupPortByName("downloader");
        }
      }, onError: (error) {
        logger.e('Download error: $error');
        sink.flush().then((_) => sink.close());
        downloadState.setError(error.toString());
        completer.complete(false);

        if (sendPort != null) {
          try {
            sendPort!.send(jsonEncode(downloadState.toJson()));
          } catch (error) {
            logger.e('send port error ($fileKey): $error');
          }
        }
      }, onDone: () {
        logger.i('Download complete');
        sink.flush().then((_) => sink.close().then((_) {
              file.renameSync(filePath);
              downloadState.completed();
              completer.complete(true);

              if (sendPort != null) {
                try {
                  sendPort!.send(jsonEncode(downloadState.toJson()));
                } catch (error) {
                  logger.e('send port error ($fileKey): $error');
                }
              }
            }));
      }, cancelOnError: true);
    } catch (error) {
      logger.e('Download error: $error');
      downloadState.setError(error.toString());
      completer.complete(false);

      if (sendPort != null) {
        try {
          sendPort!.send(jsonEncode(downloadState.toJson()));
        } catch (error) {
          logger.e('send port error ($fileKey): $error');
        }
      }
    }

    return completer.future;
  }

  /// returns true if the download was started or doesn't need to be started
  ///
  /// Intended to be called from a worker
  static Future<bool> startQueuedDownload(
      String uid, String token, String appDocDir) async {
    // get the oldest planned download
    final download = await getOldestPlannedDownload();
    if (download == null) {
      logger.i('No planned downloads');
      return true;
    }

    // if start date was more than 12 hours ago, return true
    if (DateTime.now().difference(
            DateTime.fromMillisecondsSinceEpoch(download.unixTime)) >=
        const Duration(hours: 12)) {
      logger.i('Upload started more than 12 hours ago, killing worker.');
      removePlannedDownload(download.fileKey);
      return startQueuedDownload(uid, token, appDocDir);
    }

    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloader");
    final filePath =
        '$appDocDir/${getFilePathFromKey(download.fileKey, uid)}'; // Define the file path

    if (!Directory(appDocDir).existsSync()) {
      logger.e('Could not get appDocDir');
      return false;
    }

    getOfflineFile(download.fileKey, uid).then((value) {
      if (value.existsSync()) {
        logger.i('File already exists: ${value.path}');
        return true;
      }
    });

    final downloadState = DownloadState.inProgress(download.fileKey);
    final completer = Completer<bool>();
    try {
      // Ensure the directory exists
      final directory = Directory(appDocDir);
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      // Initialize progress to 0
      double progress = 0.0;

      final file = File('$filePath.part');

      if (!await file.exists()) {
        await file.create(recursive: true);
      }
      final sink = file.openWrite();

      const Duration rateLimit =
          Duration(milliseconds: 300); // Adjust the duration as needed
      DateTime lastDataSentTime = DateTime.now();

      final response = await getFile(uid, download.fileKey, token);
      response.stream.listen((data) async {
        final totalBytes = response.contentLength ?? 0;
        progress += data.length / totalBytes;
        downloadState.updateProgress(progress);

        sink.add(data);

        // The port might be null if the main isolate is not running.
        if (sendPort != null) {
          // rate limit to prevent spamming the main isolate
          if (DateTime.now().difference(lastDataSentTime) >= rateLimit) {
            try {
              sendPort!.send(jsonEncode(downloadState.toJson()));
            } catch (error) {
              logger.e('send port error (${download.fileKey}): $error');
            }
            lastDataSentTime = DateTime.now();
          }
        } else {
          sendPort = IsolateNameServer.lookupPortByName("downloader");
        }
      }, onError: (error) {
        logger.e('Download error: $error');
        sink.flush().then((_) => sink.close());
        downloadState.setError(error.toString());
        completer.complete(false);

        if (sendPort != null) {
          try {
            sendPort!.send(jsonEncode(downloadState.toJson()));
          } catch (error) {
            logger.e('send port error (${download.fileKey}): $error');
          }
        }
      }, onDone: () {
        logger.i('Download complete');
        sink.flush().then((_) async {
          await sink.close();
          file.renameSync(filePath);
        });
        downloadState.completed();
        completer.complete(true);

        if (sendPort != null) {
          try {
            sendPort!.send(jsonEncode(downloadState.toJson()));
          } catch (error) {
            logger.e('send port error (${download.fileKey}): $error');
          }
        }
      }, cancelOnError: true);
    } catch (error) {
      logger.e('Download error: $error');
      downloadState.setError(error.toString());
      completer.complete(false);

      if (sendPort != null) {
        try {
          sendPort!.send(jsonEncode(downloadState.toJson()));
        } catch (error) {
          logger.e('send port error (${download.fileKey}): $error');
        }
      }
    }

    // remove the planned download & start next
    removePlannedDownload(download.fileKey);
    if (await isDownloadsRemaining()) {
      startQueuedDownload(uid, token, appDocDir);
    }

    return completer.future;
  }
}

class DownloadItem {
  String fileKey;
  int unixTime;

  DownloadItem(this.fileKey, this.unixTime);
}
