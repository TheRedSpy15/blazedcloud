import 'dart:isolate';

import 'package:blazedcloud/controllers/download_controller.dart';
import 'package:blazedcloud/controllers/upload_controller.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/transfers/download_state.dart';
import 'package:blazedcloud/models/transfers/upload_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadControllerProvider = Provider<DownloadController>((ref) {
  return DownloadController(ref);
});

final downloadReceivePortProvider = Provider<ReceivePort>((ref) {
  return ReceivePort();
});

final downloadStateProvider =
    StateNotifierProvider<DownloadStateNotifier, List<DownloadState>>(
  (ref) => DownloadStateNotifier(),
);

final uploadControllerProvider = Provider<UploadController>((ref) {
  return UploadController(ref);
});

final uploadReceivePortProvider = Provider<ReceivePort>((ref) {
  return ReceivePort();
});

final uploadStateProvider =
    StateNotifierProvider<UploadStateNotifier, List<UploadState>>(
  (ref) => UploadStateNotifier(),
);

class DownloadStateNotifier extends StateNotifier<List<DownloadState>> {
  DownloadStateNotifier() : super([]);

  int addDownload(DownloadState downloadState) {
    state = [...state, downloadState];
    return state.length -
        1; // Return the index where the download state was added
  }

  void updateDownloadState(int index, DownloadState downloadState) {
    final updatedStates = List.of(state);
    updatedStates[index] = downloadState;
    state = updatedStates;
  }

  void updateDownloadStateByKey(String key, DownloadState downloadState) {
    final index = state.indexWhere((element) => element.downloadKey == key);
    if (index != -1) {
      updateDownloadState(index, downloadState);
    } else {
      logger.i('Download state not found: $key');

      // Add the download state if it doesn't exist
      addDownload(downloadState);
    }
  }
}

class UploadStateNotifier extends StateNotifier<List<UploadState>> {
  UploadStateNotifier() : super([]);

  int addUpload(UploadState uploadState) {
    state = [...state, uploadState];
    return state.length -
        1; // Return the index where the upload state was added
  }

  void updateUploadState(int index, UploadState uploadState) {
    final updatedStates = List.of(state);
    updatedStates[index] = uploadState;
    state = updatedStates;
  }

  void updateUploadStateByKey(String key, UploadState uploadState) {
    final index = state.indexWhere((element) => element.uploadKey == key);
    if (index != -1) {
      updateUploadState(index, uploadState);
    } else {
      addUpload(uploadState);
    }
  }
}
