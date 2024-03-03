import 'dart:async';
import 'dart:io';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/files_api/list_files.dart';
import 'package:blazedcloud/models/transfers/download_state.dart';
import 'package:file_picker/file_picker.dart' as fp;
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Check if the user has granted access to the download directory
Future<bool> checkIfAccessToDownloadDirectoryIsGranted() async {
  final downloadDirectory = await getExportDirectoryFromPrefs();
  final downloadFolder = File(downloadDirectory);

  if (downloadDirectory.isEmpty) {
    return false;
  } else if (downloadFolder.existsSync()) {
    return true;
  } else {
    return true;
  }
}

num computeTotalSizeGb(ListBucketResult list) {
  if (list.contents == null) {
    return 0;
  }

  num totalSize = 0;
  for (var item in list.contents!) {
    totalSize += item.size!;
  }

  // convert to GB from bytes
  totalSize = totalSize / 1000000000;
  return totalSize;
}

String filterUidFromKey(String key) {
  // if the key starts with the uid + /, remove it
  if (key.startsWith(pb.authStore.model.id + '/')) {
    return key.substring(pb.authStore.model.id.length + 1);
  } else {
    return key;
  }
}

String formatMinutes(int minutes) {
  // Format the minutes into a string using format 15m or 1h45m or 24h10m
  if (minutes < 60) {
    return '${minutes}m';
  } else {
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (remainingMinutes == 0) {
      return '${hours}h';
    } else {
      return '${hours}h${remainingMinutes}m';
    }
  }
}

String formatSize(int sizeBytes) {
  // Format the size into a string using format 1.5GB or 1.5MB or 1.5KB or 1.5B
  if (sizeBytes < 1000) {
    return '${sizeBytes}B';
  } else if (sizeBytes < 1000000) {
    return '${(sizeBytes / 1000).toStringAsFixed(1)}KB';
  } else if (sizeBytes < 1000000000) {
    return '${(sizeBytes / 1000000).toStringAsFixed(1)}MB';
  } else {
    return '${(sizeBytes / 1000000000).toStringAsFixed(1)}GB';
  }
}

List<String> fuzzySearch(String query, List<String> list) {
  // filter out empty strings and place holder files
  list = list
      .where((item) => item.isNotEmpty && !item.contains('.blazed-placeholder'))
      .toList();

  // Calculate a "score" for each item in the list based on how close it matches the query
  final scoredItems = list.map<Map<String, dynamic>>((item) {
    final lowerCaseItem = item.toLowerCase();
    final lowerCaseQuery = query.toLowerCase();

    // Calculate a score based on how many characters in the query match consecutively
    int score = 0;
    int queryIndex = 0;
    for (int i = 0; i < lowerCaseItem.length; i++) {
      if (queryIndex < lowerCaseQuery.length &&
          lowerCaseItem[i] == lowerCaseQuery[queryIndex]) {
        score++;
        queryIndex++;
      }
    }

    return {'item': item, 'score': score};
  }).toList();

  // Sort items by score in descending order
  scoredItems.sort((a, b) => (b['score'] as int).compareTo(a['score'] as int));

  // Filter out items that don't contain the query at all
  final filteredResults = scoredItems
      .where((item) =>
          (item['item'] as String).toLowerCase().contains(query.toLowerCase()))
      .take(10)
      .map<String>((item) => item['item'] as String)
      .toList();

  return filteredResults;
}

/// prompt user to select a directory for downloads
Future<String> getExportDirectoryFromPicker() async {
  // IOS has different file permissions
  if (Platform.isIOS) {
    final directory = await getDownloadsDirectory();
    if (directory != null) {
      return directory.path;
    } else {
      return '';
    }
  }

  final path = await fp.FilePicker.platform.getDirectoryPath();
  final prefs = await SharedPreferences.getInstance();

  if (path != null) {
    logger.i('User selected directory: $path');
    await prefs.setString('downloadDirectory', path);
    return path;
  } else {
    // User canceled the picker
    logger.i('User canceled directory picker');
    return '';
  }
}

/// Get the download directory from shared preferences
Future<String> getExportDirectoryFromPrefs() async {
  // IOS has different file permissions
  if (Platform.isIOS) {
    final directory = await getApplicationDocumentsDirectory();
    logger.i('Download directory (IOS): ${directory.path}');
    return directory.path;
  }

  final prefs = await SharedPreferences.getInstance();

  // check if Hive has a download directory saved
  final downloadDirectory = prefs.getString('downloadDirectory');

  if (downloadDirectory != null) {
    // check if the directory still exists or we still have access to it
    final directory = Directory(downloadDirectory);
    if (await directory.exists()) {
      // Hive has a download directory saved, so return
      return downloadDirectory;
    }
  }

  return '';
}

getFileDirectory(String key) {
  // remove the file name from the key
  return key.substring(0, key.lastIndexOf('/') + 1);
}

String getFileName(String filename) {
  // only return string after last '/'
  return filename.substring(filename.lastIndexOf('/') + 1);
}

String getFilePathFromKey(String key, String uid) {
  // remove uid + / if the key starts with it
  if (key.startsWith('$uid/')) {
    return key = key.substring(uid.length + 1);
  }
  return key;
}

/// DO NOT USE AS FOR CONTENT-TYPE HEADER. This is purely for UI purposes
FileType getFileType(String fileName) {
  final type = lookupMimeType(fileName) ?? 'application/octet-stream';
  if (type.contains("audio")) {
    return FileType.audio;
  } else if (type.contains("video")) {
    return FileType.video;
  } else if (type.contains("image")) {
    return FileType.image;
  } else if (type.contains("text")) {
    return FileType.doc;
  } else if (type.contains("pdf")) {
    return FileType.doc;
  } else if (type.contains("zip")) {
    return FileType.other;
  } else if (type.contains("folder")) {
    return FileType.folder;
  } else {
    return FileType.other;
  }
}

String getFolderFromKey(String key) {
  // remove the file name from the key
  return key.substring(0, key.lastIndexOf('/') + 1);
}

List<String> getFolderList(ListBucketResult list) {
  if (list.commonPrefixes == null) {
    return [];
  }

  Set<String> folderKeys = {};
  List<String> keys = getKeysFromList(list, true);

  for (var key in keys) {
    // remove everything after the last / including the /
    final folderKey = key.substring(0, key.lastIndexOf('/') + 1);

    // add the folder key to the set
    folderKeys.add(folderKey);
  }

  return folderKeys.toList();
}

String getFolderName(String folderKey) {
  // remove the last segment of the folder key
  if (folderKey.endsWith('/')) {
    folderKey = folderKey.substring(0, folderKey.length - 1);
  }
  return folderKey.substring(folderKey.lastIndexOf('/') + 1);
}

List<String> getKeysFromList(ListBucketResult list, bool keepStartingDir) {
  if (list.contents == null) {
    return [];
  }

  List<String> keys = [];
  for (var item in list.contents!) {
    final key = item.key;

    // remove the starting directory from the key
    if (key!.startsWith(getStartingDirectory()) && !keepStartingDir) {
      keys.add(key.substring(getStartingDirectory().length));
    } else {
      keys.add(key);
    }
  }
  return keys;
}

List<String> getKeysInFolder(
    ListBucketResult list, String folderKey, bool keepFullKey) {
  if (list.contents == null) {
    return [];
  }

  List<String> keys = [];
  for (var item in list.contents!) {
    final key = item.key;

    if (key!.startsWith(folderKey)) {
      if (keepFullKey) {
        keys.add(key);
      } else {
        keys.add(key.substring(folderKey.length));
      }
    }
  }
  return keys;
}

Future<File> getOfflineFile(String fileKey, String uid) async {
  // Get the directory for the app's internal storage
  final directory = await getExportDirectoryFromPrefs();

  // remove the uid from the key
  fileKey = fileKey.substring(uid.length + 1);

  // Construct the file path using the filename
  final filePath = File('$directory/$fileKey');

  return filePath;
}

String getParentDirectory(String workingDir) {
  // remove the last segment of the working directory
  if (workingDir.endsWith('/')) {
    workingDir = workingDir.substring(0, workingDir.length - 1);
  }
  return workingDir.substring(0, workingDir.lastIndexOf('/') + 1);
}

String getStartingDirectory() {
  return pb.authStore.model.id + '/';
}

Future<List<File?>> getUploadSelection() async {
  final result = await fp.FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: fp.FileType.any,
  );

  if (result != null) {
    List<File?> files = result.paths.map((path) => File(path!)).toList();
    return files;
  } else {
    // User canceled the picker
    return [];
  }
}

bool isFileBeingDownloaded(String file, List<DownloadState> downloads) {
  for (var download in downloads) {
    if (download.downloadKey == file && download.isDownloading) {
      return true;
    }
  }
  return false;
}

Future<bool> isFileSavedOffline(String fileKey) async {
  final directory = await getExportDirectoryFromPrefs();

  // Construct the file path using the filename
  String relativePath = fileKey.replaceAll(directory, "");
  relativePath = relativePath.substring(relativePath.indexOf('/') + 1);

  final filePath = File('$directory/$relativePath');

  // Check if the file exists
  return filePath.exists();
}

bool isFolderInDirectory(String key, String workingDir) {
  // return true if file name is immediately after workingDir
  return key.startsWith(workingDir) &&
      key.substring(workingDir.length).contains('/');
}

bool isKeyInDirectory(String key, bool folder, String workingDir) {
  if (folder) {
    // remove the last segment of the key
    if (key.endsWith('/')) {
      key = key.substring(0, key.length - 1);
    }
  }
  // return true if file name is immediately after workingDir
  return key.startsWith(workingDir) &&
      !key.substring(workingDir.length).contains('/');
}

void openFile(File file) {
  file.exists().then((exists) {
    if (exists) {
      OpenFilex.open(file.path);
    } else {
      logger.e('File does not exist: ${file.path}');
    }
  });
}

/// Show dialog explaining to the user that they need to select a directory in the next step
Future<String> promptForDownloadDirectory(BuildContext context) async {
  String? directory = await showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(S.of(context).selectDownloadDirectory),
        content: Text(
            S.of(context).pleaseSelectADirectoryWhereYouWouldLikeToDownload),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'select');
            },
            child: Text(S.of(context).pickFolder),
          ),
        ],
      );
    },
  );

  if (directory == 'select') {
    directory = await getExportDirectoryFromPicker();
  }

  return '';
}

enum FileType { image, video, audio, doc, other, folder }
