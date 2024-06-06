import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/transfers/upload_state.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:blazedcloud/providers/transfers_providers.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:blazedcloud/services/notifications.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';
import 'package:workmanager/workmanager.dart';

final dio = Dio()..httpClientAdapter = NativeAdapter();

/// orchestrates uploads that are user initiated and need to interact with the UI
class UploadController {
  final ProviderRef<Object> _ref;

  UploadController(this._ref) {
    final port = _ref.read(uploadReceivePortProvider);
    IsolateNameServer.registerPortWithName(port.sendPort, "uploader");
    port.listen((dynamic data) async {
      try {
        final uploadState = UploadState.fromJson(jsonDecode(data));
        logger.i('Received upload state: ${uploadState.toJson()}');

        final uploadNotifier = _ref.read(uploadStateProvider.notifier);
        uploadNotifier.updateUploadStateByKey(
            uploadState.uploadKey, uploadState);

        updateUploadNotification();

        if (!uploadState.isUploading) {
          _ref.invalidate(
              fileListProvider(_ref.read(currentDirectoryProvider)));
          _ref.invalidate(combinedDataProvider(pb.authStore.model.id));
        }
      } catch (error) {
        logger.e('Error updating upload state: $error \n $data');
      }
    });
  }

  /// start an upload with workmanager
  ///
  /// If on Android, the queue name is used to identify the worker. On iOS, we have to use a generic name from info.plist
  void scheduleUpload(UploadRequestQueue request) async {
    if (Platform.isIOS) {
      request.queueName = "upload-task";
    }
    Workmanager()
        .registerOneOffTask(request.queueName, "upload-task",
            backoffPolicy: BackoffPolicy.exponential,
            outOfQuotaPolicy:
                OutOfQuotaPolicy.run_as_non_expedited_work_request,
            existingWorkPolicy: Platform.isAndroid
                ? ExistingWorkPolicy.replace
                : ExistingWorkPolicy.keep,
            tag: request.queueName,
            constraints: Constraints(networkType: NetworkType.connected),
            inputData: request.toJson())
        .then((value) => logger.d("Upload scheduled"));
  }

  /// prompt user for file selection, then schedule uploads
  ///
  /// [remoteDir] is the directory to upload to
  void selectFilesToUpload(String remoteDir) async {
    final selection = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.any, withReadStream: true);

    if (selection != null) {
      final uid = pb.authStore.model.id;
      final token = pb.authStore.token;

      if (isMobile) {
        final randQueueName =
            'uploadQueue${DateTime.now().millisecondsSinceEpoch}';

        // create queue of uploads
        final queue = UploadRequestQueue(
            uid,
            token,
            remoteDir,
            selection.paths.map((e) => e ?? '').toList(),
            selection.files.map((e) => e.name).toList(),
            selection.files.map((e) => e.size).toList(),
            randQueueName);

        logger.i('Creating queue: ${queue.toJson()}');
        scheduleUpload(queue);
      } else {
        // don't use workmanager on desktop, just simple isolates.
        for (PlatformFile file in selection.files) {
          final isolateToken = RootIsolateToken.instance;
          if (isolateToken == null) {
            logger.e('RootIsolateToken is null');
            return;
          }
          BackgroundIsolateBinaryMessenger.ensureInitialized(isolateToken);

          final path = file.path;
          if (path == null) {
            logger.e('File path is null');
            return;
          }
          final name = file.name;
          final size = file.size;
          logger.i('Starting download directly. token: ${pb.authStore.token}');
          Isolate.run(() =>
              startUploadDirectly(uid, path, name, size, remoteDir, token));
        }
      }
    }
  }

  void updateUploadNotification() {
    if (!isMobile || isRequestingNotificationPermission) return;

    isRequestingNotificationPermission = true;
    NotificationService().initNotification().then((_) {
      NotificationService().showUploadNotification(_ref
          .read(uploadStateProvider)
          .where((element) => element.isUploading && !element.isError)
          .length);
      isRequestingNotificationPermission = false;
    }).catchError((error) {
      logger.e('Error initializing notifications: $error');
      isRequestingNotificationPermission = false;
    });
  }

  /// goes through upload queue and starts uploads. if an upload fails, it will be reattempted. Otherwise, it will be removed from the queue
  static Future<bool> processUploadQueue(
      String uid,
      List<String> localPaths,
      List<String> localNames,
      List<int> sizes,
      String s3Directory,
      String token,
      String startDate,
      String queueName) async {
    logger.d("Processing upload queue: $localPaths");

    // for each file, start an upload. if any fail, reschedule the worker
    for (int i = 0; i < localPaths.length; i++) {
      var filename = localNames[i];
      final isSuccess = await startUpload(uid, localPaths[i], filename,
          sizes[i], s3Directory, token, startDate);

      if (!isSuccess) {
        logger.e('Upload queue failed: $queueName');
        final queue = UploadRequestQueue(
            uid, token, s3Directory, localPaths, localNames, sizes, queueName);
        await Workmanager().registerOneOffTask(queueName, "upload",
            backoffPolicy: BackoffPolicy.linear,
            tag: queueName,
            outOfQuotaPolicy:
                OutOfQuotaPolicy.run_as_non_expedited_work_request,
            existingWorkPolicy: ExistingWorkPolicy.replace,
            constraints: Constraints(networkType: NetworkType.connected),
            inputData: queue.toJson());
      } else {
        // remove the files from cache.
        // should only be done on mobile,
        // and we know the queue for mobile only
        final file = File(localPaths[i]);
        if (file.existsSync()) {
          file.deleteSync();
        }
      }
    }

    return true;
  }

  /// returns true if the download was started, doesn't need to be started or can't be started
  static Future<bool> startUpload(
      String uid,
      String localPath,
      String localName,
      int size,
      String s3Directory,
      String token,
      String startDate) async {
    logger.i('Starting upload: $localPath');

    // return true if start date is more than 12 hours ago
    if (DateTime.now().difference(DateTime.parse(startDate)) >=
        const Duration(hours: 12)) {
      logger.i('Upload started more than 12 hours ago, killing worker.');
      return true;
    }

    final uploadState = UploadState(
      isUploading: true,
      isError: false,
      uploadKey: localPath,
      size: size,
      sent: 0,
    );
    SendPort? sendPort = IsolateNameServer.lookupPortByName("uploader");
    const Duration rateLimit =
        Duration(seconds: 1); // Adjust the duration as needed
    DateTime lastDataSentTime = DateTime.now();

    final fileKey = '$s3Directory$localName';
    final type = lookupMimeType(localPath) ?? 'application/octet-stream';

    final completer = Completer<bool>();
    try {
      final file = File(localPath);
      if (!file.existsSync()) {
        logger.e('File not in cache: $localPath');
        uploadState.setError('Cache ran out of space');
        completer.complete(true);
        return completer.future;
      }

      final uploadUrl = await getUploadUrl(
        uid,
        fileKey,
        token,
        size,
        contentType: type,
      );
      logger.i('Upload url: $uploadUrl');

      bytes() async* {
        yield* file.openRead();
      }

      final multipartFile = MultipartFile.fromStream(
        bytes,
        size,
        filename: localName,
        contentType: MediaType.parse(type),
      );

      final response = await dio.put(
        uploadUrl,
        data: multipartFile.finalize(),
        options:
            Options(headers: {"Content-Type": type, "Content-Length": size}),
        onSendProgress: (int sent, int total) {
          uploadState.updateTotalSent(sent);

          // send progress to the UI
          // The port might be null if the main isolate is not running.
          if (sendPort != null) {
            // rate limit to prevent spamming the main isolate
            if (DateTime.now().difference(lastDataSentTime) >= rateLimit) {
              try {
                sendPort!.send(jsonEncode(uploadState.toJson()));
              } catch (error) {
                logger.e('send port error ($fileKey): $error');
              }
              lastDataSentTime = DateTime.now();
            } else if (!uploadState.isUploading || uploadState.isError) {
              // don't rate limit if we're not uploading or if there's an error
              try {
                sendPort!.send(jsonEncode(uploadState.toJson()));
              } catch (error) {
                logger.e('send port error ($fileKey): $error');
              }
            }
          } else {
            sendPort = IsolateNameServer.lookupPortByName("uploader");
          }
        },
      );
      uploadState.completed();
      completer.complete(true);

      // send progress to the UI
      if (sendPort != null) {
        try {
          sendPort!.send(jsonEncode(uploadState.toJson()));
        } catch (error) {
          logger.e('send port error ($fileKey): $error');
        }
      }

      logger.i(
          'Upload response: ${response.statusCode} ${response.statusMessage}');
    } catch (error) {
      switch (error) {
        case DioException():
          final response = error.response;
          logger.e('Error uploading file: ${error.message} - $response');
        default:
          logger.e('Upload error: $error');
      }

      uploadState.setError(error.toString());
      completer.complete(false);

      // send progress to the UI
      if (sendPort != null) {
        try {
          sendPort!.send(jsonEncode(uploadState.toJson()));
        } catch (error) {
          logger.e('send port error ($fileKey): $error');
        }
      }
    }

    return completer.future;
  }

  static Future<bool> startUploadDirectly(String uid, String localPath,
      String localName, int size, String s3Directory, String token) async {
    logger.i('Starting upload: $localPath');

    final uploadState = UploadState(
      isUploading: true,
      isError: false,
      uploadKey: localPath,
      size: size,
      sent: 0,
    );
    SendPort? sendPort = IsolateNameServer.lookupPortByName("uploader");
    const Duration rateLimit =
        Duration(seconds: 1); // Adjust the duration as needed
    DateTime lastDataSentTime = DateTime.now();

    final fileKey = '$s3Directory$localName';
    final type = lookupMimeType(localPath) ?? 'application/octet-stream';

    final completer = Completer<bool>();
    try {
      final file = File(localPath);
      if (!file.existsSync()) {
        logger.e('File not in cache: $localPath');
        uploadState.setError('Cache ran out of space');
        completer.complete(true);
        return completer.future;
      }

      final uploadUrl = await getUploadUrl(
        uid,
        fileKey,
        token,
        size,
        contentType: type,
      );
      logger.i('Upload url: $uploadUrl');

      bytes() async* {
        yield* file.openRead();
      }

      final multipartFile = MultipartFile.fromStream(
        bytes,
        size,
        filename: localName,
        contentType: MediaType.parse(type),
      );

      final response = await dio.put(
        uploadUrl,
        data: multipartFile.finalize(),
        options:
            Options(headers: {"Content-Type": type, "Content-Length": size}),
        onSendProgress: (int sent, int total) {
          uploadState.updateTotalSent(sent);

          // send progress to the UI
          // The port might be null if the main isolate is not running.
          if (sendPort != null) {
            // rate limit to prevent spamming the main isolate
            if (DateTime.now().difference(lastDataSentTime) >= rateLimit) {
              try {
                sendPort!.send(jsonEncode(uploadState.toJson()));
              } catch (error) {
                logger.e('send port error ($fileKey): $error');
              }
              lastDataSentTime = DateTime.now();
            } else if (!uploadState.isUploading || uploadState.isError) {
              // don't rate limit if we're not uploading or if there's an error
              try {
                sendPort!.send(jsonEncode(uploadState.toJson()));
              } catch (error) {
                logger.e('send port error ($fileKey): $error');
              }
            }
          } else {
            sendPort = IsolateNameServer.lookupPortByName("uploader");
          }
        },
      );
      uploadState.completed();
      completer.complete(true);

      // send progress to the UI
      if (sendPort != null) {
        try {
          sendPort!.send(jsonEncode(uploadState.toJson()));
        } catch (error) {
          logger.e('send port error ($fileKey): $error');
        }
      }

      logger.i(
          'Upload response: ${response.statusCode} ${response.statusMessage}');
    } catch (error) {
      switch (error) {
        case DioException():
          final response = error.response;
          logger.e('Error uploading file: ${error.message} - $response');
        default:
          logger.e('Upload error: $error');
      }

      uploadState.setError(error.toString());
      completer.complete(false);

      // send progress to the UI
      if (sendPort != null) {
        try {
          sendPort!.send(jsonEncode(uploadState.toJson()));
        } catch (error) {
          logger.e('send port error ($fileKey): $error');
        }
      }
    }

    return completer.future;
  }
}

class UploadRequestQueue {
  String uid;
  String token;
  String s3Directory;
  List<String> localPaths;
  List<String> localNames;
  List<int> sizes;
  String startDate = DateTime.now().toUtc().toIso8601String();
  String queueName;

  UploadRequestQueue(this.uid, this.token, this.s3Directory, this.localPaths,
      this.localNames, this.sizes, this.queueName);

  UploadRequestQueue.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        token = json['token'],
        s3Directory = json['s3Directory'],
        localPaths = json['localPaths'],
        localNames = json['localNames'],
        sizes = json['sizes'],
        startDate = json['startDate'],
        queueName = json['queueName'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'token': token,
        's3Directory': s3Directory,
        'localPaths': localPaths,
        'localNames': localNames,
        'sizes': sizes,
        'startDate': startDate,
        'queueName': queueName,
      };
}
