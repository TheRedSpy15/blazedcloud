import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/files_api/list_files.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:http/http.dart' as http;

/// in memory list of file links. To prevent constantly getting links from the server for file page
final fileLinks = <String, String>{};
final httpClient = http.Client();

Future<void> changeObjectKey(
    String uid, String oldKey, String newKey, String token) async {
  var headers = {'Authorization': 'Bearer $token'};
  var request =
      http.MultipartRequest('POST', Uri.parse('$backendUrl/data/rename/$uid'));
  request.fields.addAll({'oldKey': oldKey, 'newKey': newKey});

  request.headers.addAll(headers);

  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    logger.d("Renamed object $oldKey to $newKey");
  } else {
    logger.e(
        "Failed to rename object $oldKey to $newKey. ${response.reasonPhrase}\n${await response.stream.bytesToString()}");
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

  final response = await httpClient.put(Uri.parse(uploadUrl), body: body);
  return response.statusCode == 200;
}

Future<bool> deleteFile(String uid, String fileKey, String token) async {
  var headers = {'Authorization': 'Bearer $token'};
  var request = http.MultipartRequest(
      'DELETE', Uri.parse('$backendUrl/data/delete/$uid/file'));
  request.fields.addAll({'fileKey': fileKey});

  request.headers.addAll(headers);

  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    logger.d("Deleted file $fileKey");
    return true;
  } else {
    logger.e(response.reasonPhrase);
    return false;
  }
}

Future<bool> deleteFolder(String uid, String folderKey, String token) async {
  var headers = {'Authorization': 'Bearer $token'};
  var request = http.MultipartRequest(
      'DELETE', Uri.parse('$backendUrl/data/delete/$uid/folder'));
  request.fields.addAll({'folderKey': filterUidFromKey(folderKey)});

  request.headers.addAll(headers);

  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    logger.d("Deleted folder $folderKey");
    return true;
  } else {
    logger.e(response.reasonPhrase);
    return false;
  }
}

Future<List<String>> getAllowedEmailDomains() async {
  var request = http.Request('GET', Uri.parse('$backendUrl/config/emails'));
  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    logger.d("Got allowed email domains $responseBody");
    return List<String>.from(jsonDecode(responseBody));
  } else {
    logger.e(response.reasonPhrase);

    // fallback to protonmail and gmail
    return ["protonmail.com", "gmail.com"];
  }
}

/// gets all objects in camera-backup folder. Rate limited to 1 request per second by api.
/// Returns only the string after the last / in the key
Future<List<String>> getCameraSyncList(String uid, String token) async {
  var headers = {'Authorization': 'Bearer $token', 'redirect': 'follow'};
  var request = http.Request(
      'GET', Uri.parse('$backendUrl/data/listall/camerasync/$uid'));

  request.headers.addAll(headers);

  // data is returned as array of Contents objects
  final response = await httpClient.send(request);

  if (response.statusCode == HttpStatus.insufficientStorage) {
    throw Exception('folderSync cancelled - Not enough storage');
  }

  if (response.statusCode == 200) {
    List<String> keys = List.empty(growable: true);
    final responseBody = await response.stream.bytesToString();

    try {
      final json = jsonDecode(responseBody);
      for (var item in json) {
        keys.add(item['Key'].split('/').last);
      }
    } catch (e) {
      logger.e("Error parsing camera sync list: $e");
      logger.e(responseBody);
    }

    return keys;
  } else {
    logger.e(response.reasonPhrase);
    throw Exception('Failed to camera sync list');
  }
}

Future<http.StreamedResponse> getFile(
    String uid, String fileKey, String token) async {
  logger.i("Getting file ${getFileName(fileKey)} with key $fileKey");
  final link = await getFileLink(uid, fileKey, token);

  var request = http.MultipartRequest('GET', Uri.parse(link.toString()));
  request.fields.addAll({'file': getFileName(fileKey)});

  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    logger.d("Got file $fileKey");
    return response;
  } else {
    response.stream.bytesToString().then((value) => logger
        .e("${response.reasonPhrase} - ${response.statusCode} \n $value"));
    logger.e("");
    throw Exception('Failed to get file');
  }
}

/// don't call directly to download files. This is used by getFile(). Unless you want to share the link
Future<String> getFileLink(String uid, String filename, String token,
    {bool sharing = false, String duration = "15m"}) async {
  var request =
      http.MultipartRequest('POST', Uri.parse('$backendUrl/data/down/$uid'));

  if (!sharing) {
    // check in memory list first
    if (fileLinks.containsKey(filename)) {
      return fileLinks[filename]!;
    }

    request.fields.addAll({'filename': filename});
  } else {
    request.fields.addAll(
        {'filename': filename, 'duration': duration, 'useShlink': 'true'});
  }

  var headers = {'Authorization': 'Bearer $token'};
  request.headers.addAll(headers);

  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();

    // add link to in memory list if not sharing
    if (!sharing) {
      fileLinks[filename] = responseBody;
    }

    return responseBody;
  } else {
    logger.e(response.reasonPhrase);
    throw Exception('Failed to get link');
  }
}

Future<ListBucketResult> getFilelist(
    String uid, String from, String token) async {
  logger.d("Getting file list for $uid");
  var headers = {'Authorization': 'Bearer $token'};
  var request = http.Request('POST', Uri.parse('$backendUrl/data/list/$uid'));

  request.body = jsonEncode({'from': from});
  request.headers.addAll(headers);

  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    final responseBody = await response.stream.transform(utf8.decoder).join();
    return ListBucketResult.fromJson(jsonDecode(responseBody));
  } else {
    logger.e(response.reasonPhrase);
    throw Exception('Failed to load file list');
  }
}

Future<ListBucketResult> getFilelistByFolder(
    String uid, String prefix, String token) async {
  logger.d("Getting file list $prefix");
  var headers = {'Authorization': 'Bearer $token'};

  var form = {'prefix': prefix};
  final response = await httpClient.post(
      Uri.parse('$backendUrl/data/v2/list/$uid'),
      headers: headers,
      body: form);

  if (response.statusCode == 200) {
    final result = ListBucketResult.fromJson(jsonDecode(response.body));
    logger.d("Got file list. Size: ${result.contents?.length} Prefix: $prefix");

    // remove place holder file
    result.contents?.removeWhere((element) =>
        element.key == "$prefix.blazed-placeholder" ||
        element.key == "$prefix/.blazed-placeholder");

    return result;
  } else {
    logger.e(response.reasonPhrase);
    throw Exception('Failed to load file list');
  }
}

/// gets all objects for a user. Rate limited to 1 request per second by api. Returns only keys
Future<List<String>> getSearchList(String uid, String token) async {
  var headers = {'Authorization': 'Bearer $token', 'redirect': 'follow'};
  var request = http.Request('GET', Uri.parse('$backendUrl/data/listall/$uid'));

  request.headers.addAll(headers);

  // data is returned as array of Contents objects
  final response = await httpClient.send(request);

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    List<String> keys = List.empty(growable: true);

    try {
      final json = jsonDecode(responseBody);
      for (var item in json) {
        keys.add(item['Key']);
      }
    } catch (e) {
      logger.e("Error parsing search list: $e");
    }

    return keys;
  } else {
    logger.e(response.reasonPhrase);
    throw Exception('Failed to load file list');
  }
}

Future<String> getStripeCheckout(
    String uid, String priceId, String token) async {
  var headers = {'Authorization': 'Bearer $token'};
  var request =
      http.Request('POST', Uri.parse('$backendUrl/stripe/checkout/$uid'));
  request.bodyFields = {'priceId': priceId};
  request.headers.addAll(headers);

  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    logger.d("Got stripe checkout $responseBody");
    return jsonDecode(responseBody)['url'];
  } else {
    logger.e(response.reasonPhrase);
    throw Exception('Failed to get stripe checkout');
  }
}

/// uid is automatically added to key by back end, if not present
Future<String> getUploadUrl(
    String uid, String fileKey, String token, int length,
    {String contentType = "application/octet-stream"}) async {
  var headers = {'Authorization': 'Bearer $token'};
  var request =
      http.MultipartRequest('POST', Uri.parse('$backendUrl/data/v2/up/$uid'));
  request.fields.addAll({
    'filename': fileKey,
    'contentType': contentType,
    'contentSize': length.toString()
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    return (responseBody);
  } else {
    logger.e(
        "Upload Failed: ${response.reasonPhrase} ${response.statusCode}\n${await response.stream.bytesToString()}");
    throw Exception('Failed to get upload url');
  }
}

Future<int> getUsage(String uid, String token) async {
  // GET to /data/usage/{uid}
  logger.d("Getting usage for $uid");

  var headers = {'Authorization': 'Bearer $token'};
  var request = http.Request('GET', Uri.parse('$backendUrl/data/usage/$uid'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await httpClient.send(request);

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    logger.d("Got usage $responseBody");
    return int.parse(responseBody);
  } else {
    logger.e(response.reasonPhrase);
    throw Exception('Failed to load usage');
  }
}
