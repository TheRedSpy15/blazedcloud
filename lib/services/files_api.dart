import 'dart:io';
import 'dart:typed_data';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/files_api/list_files.dart';
import 'package:blazedcloud/models/files_api/usage.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:dio/dio.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';

final dio = Dio()
  ..options.baseUrl = backendUrl
  ..interceptors.add(QueuedInterceptor())
  ..httpClientAdapter = NativeAdapter();

Future<void> changeObjectKey(
    String uid, String oldKey, String newKey, String token) async {
  var headers = {'Authorization': 'Bearer $token'};

  final response = await dio.post('/data/rename/$uid',
      queryParameters: {'oldKey': oldKey, 'newKey': newKey},
      options: Options(headers: headers));

  if (response.statusCode == 200) {
    logger.d("Renamed object $oldKey to $newKey");
  } else {
    logger.e(
        "Failed to rename object $oldKey to $newKey. ${response.statusMessage}\n${response.statusCode}");
    throw Exception('Failed to rename object');
  }
}

/// Creates a folder with a placeholder file so that it is visible in the file list.
Future<bool> createFolder(String folderKey) async {
  // upload a file with the name folderKey + "/.blazed-placeholder"
  final filename = '$folderKey/.blazed-placeholder';
  final body = Uint8List.fromList([0]);

  final uploadUrl = await getUploadUrl(
      pb.authStore.model.id, filename, pb.authStore.token, body.length,
      contentType: "");

  final response = await dio.put(uploadUrl, data: body);
  return response.statusCode == 200;
}

Future<bool> deleteFile(String uid, String fileKey, String token) async {
  final response = await dio.delete('/data/delete/$uid/file',
      queryParameters: {'fileKey': filterUidFromKey(fileKey)},
      options: Options(headers: {'Authorization': 'Bearer $token'}));

  if (response.statusCode == 200) {
    logger.d("Deleted file $fileKey");
    return true;
  } else {
    logger.e(response.statusMessage);
    return false;
  }
}

Future<bool> deleteFolder(String uid, String folderKey, String token) async {
  final response = await dio.delete('/data/delete/$uid/folder',
      queryParameters: {'folderKey': filterUidFromKey(folderKey)},
      options: Options(headers: {'Authorization': 'Bearer $token'}));

  if (response.statusCode == 200) {
    logger.d("Deleted folder $folderKey");
    return true;
  } else {
    logger.e(response.statusMessage);
    return false;
  }
}

Future<List<String>> getAllowedEmailDomains() async {
  final response = await dio.get('/config/emails',
      options: Options(responseType: ResponseType.json));

  if (response.statusCode == 200) {
    logger.d("Got allowed email domains $response.data");
    return List<String>.from(response.data);
  } else {
    logger.e(response.statusMessage);

    // fallback to protonmail and gmail
    return [
      "protonmail.com",
      "gmail.com",
      "hotmail.com",
      "outlook.com",
      "yahoo.com"
    ];
  }
}

/// gets all objects in camera-backup folder. Rate limited to 1 request per second by api.
/// Returns only the string after the last / in the key
Future<List<String>> getCameraSyncList(String uid, String token) async {
  final response = await dio.get('/data/listall/camerasync/$uid',
      options: Options(
          headers: {'Authorization': 'Bearer $token', 'redirect': 'follow'},
          responseType: ResponseType.json));

  if (response.statusCode == HttpStatus.insufficientStorage) {
    throw Exception('folderSync cancelled - Not enough storage');
  }

  if (response.statusCode == 200) {
    List<String> keys = List.empty(growable: true);

    try {
      for (var item in response.data) {
        keys.add(item['Key'].split('/').last);
      }
    } catch (e) {
      logger.e("Error parsing camera sync list: $e");
      logger.e(response.data);
    }

    return keys;
  } else {
    logger.e(response.statusMessage);
    throw Exception('Failed to camera sync list');
  }
}

/// don't call directly to download files. This is used by getFile(). Unless you want to share the link
Future<String> getFileLink(String uid, String filename, String token,
    {bool sharing = false, String duration = "15m"}) async {
  dynamic body = {'filename': filename};
  if (sharing) {
    body = {'filename': filename, 'duration': duration, 'useShlink': 'true'};
  }

  final response = await dio.post('/data/down/$uid',
      queryParameters: body,
      options: Options(headers: {'Authorization': 'Bearer $token'}));

  if (response.statusCode == 200) {
    return response.data;
  } else {
    logger.e(response.statusMessage);
    throw Exception('Failed to get link');
  }
}

Future<ListBucketResult> getFilelistByFolder(
    String uid, String prefix, String token) async {
  logger.d("Getting file list $prefix");
  final response = await dio.post('/data/v2/list/$uid',
      queryParameters: {'prefix': prefix},
      options: Options(
          headers: {'Authorization': 'Bearer $token'},
          responseType: ResponseType.json));

  if (response.statusCode == 200) {
    final result = ListBucketResult.fromJson(response.data);
    logger.d("Got file list. Size: ${result.contents?.length} Prefix: $prefix");

    // sort by creation date
    result.contents?.sort((a, b) => b.lastModified!.compareTo(a.lastModified!));
    return result;
  } else {
    logger.e(response.statusMessage);
    throw Exception('Failed to load file list');
  }
}

/// gets all objects for a user. Rate limited to 1 request per second by api. Returns only keys
Future<List<String>> getSearchList(String uid, String token) async {
  final response = await dio.get('/data/listall/$uid',
      options: Options(
          headers: {'Authorization': 'Bearer $token', 'redirect': 'follow'},
          responseType: ResponseType.json));

  if (response.statusCode == 200) {
    List<String> keys = List.empty(growable: true);

    try {
      for (var item in response.data) {
        keys.add(item['Key']);
      }
    } catch (e) {
      logger.e("Error parsing search list: $e");
    }

    return keys;
  } else {
    logger.e(response.statusMessage);
    throw Exception('Failed to load file list');
  }
}

Future<String> getStripeCheckout(
    String uid, String priceId, String token) async {
  final response = await dio.post('/stripe/checkout/$uid',
      queryParameters: {'priceId': priceId},
      options: Options(
          headers: {'Authorization': 'Bearer $token'},
          responseType: ResponseType.json));

  if (response.statusCode == 200) {
    logger.d("Got stripe checkout ${response.data}");
    return response.data['url'];
  } else {
    logger.e(response.statusMessage);
    throw Exception('Failed to get stripe checkout');
  }
}

/// uid is automatically added to key by back end, if not present
Future<String> getUploadUrl(
    String uid, String fileKey, String token, int length,
    {String contentType = "application/octet-stream"}) async {
  final response = await dio.post('/data/v2/up/$uid',
      queryParameters: {
        'filename': fileKey,
        'contentType': contentType,
        'contentSize': length.toString()
      },
      options: Options(headers: {'Authorization': 'Bearer $token'}));

  if (response.statusCode == 200) {
    return (response.data);
  } else {
    logger.e("Upload Failed: ${response.statusMessage} ${response.statusCode}");
    throw Exception('Failed to get upload url');
  }
}

Future<Usage> getUsage(String uid, String token) async {
  logger.d("Getting usage for $uid");

  final response = await dio.get('/data/v2/usage/$uid',
      options: Options(
          headers: {'Authorization': 'Bearer $token'},
          responseType: ResponseType.json));

  if (response.statusCode == 200) {
    return Usage.fromJson(response.data);
  } else {
    logger.e(response.statusMessage);
    throw Exception('Failed to load usage');
  }
}
