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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:workmanager/workmanager.dart';

class UploadController {
  final ProviderRef<Object> _ref;

  UploadController(this._ref) {
    final port = _ref.read(uploadReceivePortProvider);
    IsolateNameServer.registerPortWithName(port.sendPort, "uploader");
    port.listen((dynamic data) async {
      try {
        final uploadState = UploadState.fromJson(jsonDecode(data));

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
  void queueUpload(String uid, String s3Directory, String localPath,
      String localName, int size) async {
    Workmanager().registerOneOffTask(localPath.hashCode.toString(), "upload",
        constraints: Constraints(
          networkType: NetworkType.unmetered,
        ),
        tag: localPath,
        backoffPolicy: BackoffPolicy.linear,
        outOfQuotaPolicy: OutOfQuotaPolicy.run_as_non_expedited_work_request,
        existingWorkPolicy: ExistingWorkPolicy.keep,
        inputData: {
          "uid": uid,
          "token": pb.authStore.token,
          "s3Directory": s3Directory,
          "localPath": localPath,
          "localName": localName,
          "size": size,
          "startDate": DateTime.now().toIso8601String(),
        });
  }

  void selectFilesToUpload(String directory) async {
    final selection = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.any, withReadStream: true);

    if (selection != null) {
      final uid = pb.authStore.model.id;

      for (final fileToUpload in selection.files) {
        queueUpload(uid, directory, fileToUpload.path!, fileToUpload.name,
            fileToUpload.size);
      }
    }
  }

  void updateUploadNotification() {
    NotificationService().initNotification().then((_) => NotificationService()
        .showUploadNotification(_ref
            .read(uploadStateProvider)
            .where((element) => element.isUploading && !element.isError)
            .length));
  }

  /// returns true if the download was started or doesn't need to be started
  static Future<bool> startUpload(
      String uid,
      String localPath,
      String localName,
      int size,
      String s3Directory,
      String token,
      String startDate) async {
    // return true if start date is more than 12 hours ago
    if (DateTime.now().difference(DateTime.parse(startDate)) >=
        const Duration(hours: 12)) {
      logger.i('Upload started more than 12 hours ago, killing worker.');
      return true;
    }

    final uploadState = UploadState.inProgress(localPath);
    SendPort? sendPort = IsolateNameServer.lookupPortByName("uploader");
    const Duration rateLimit =
        Duration(seconds: 1); // Adjust the duration as needed
    DateTime lastDataSentTime = DateTime.now();

    final fileKey = '$s3Directory$localName';
    final type = lookupMimeType(localPath) ?? 'application/octet-stream';

    final completer = Completer<bool>();
    try {
      final file = File(localPath);

      final uploadUrl = await getUploadUrl(
        uid,
        fileKey,
        token,
        size,
        contentType: type,
      );
      logger.i('Upload url: $uploadUrl');

      final dio = Dio();
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
          uploadState.addTotalSent(total);
          final progress = total / size;
          uploadState.updateProgress(progress);

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
            } else if (!uploadState.isUploading) {
              // don't rate limit if finished
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
      uploadState.completed();
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
