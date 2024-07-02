import 'package:blazedcloud/log.dart';

class DownloadState {
  bool isDownloading;
  bool isError;
  String? errorMessage;
  double progress;
  String downloadKey;
  int recieved = 0;
  int size = 0;

  DownloadState({
    required this.isDownloading,
    required this.isError,
    this.errorMessage,
    this.progress = 0.0,
    required this.downloadKey,
    required this.recieved,
    required this.size,
  });

  factory DownloadState.error(String errorMessage) => DownloadState(
        isDownloading: false,
        isError: true,
        errorMessage: errorMessage,
        downloadKey: '',
        size: 0,
        recieved: 0,
      );
  factory DownloadState.fromJson(Map<String, dynamic> json) {
    return DownloadState(
      isDownloading: json['isDownloading'] ?? false,
      isError: json['isError'] ?? false,
      errorMessage: json['errorMessage'],
      progress: json['progress'] ?? 0.0,
      downloadKey: json['downloadKey'] ?? '',
      recieved: json['recieved'] ?? 0,
      size: json['size'] ?? 0,
    );
  }

  void completed() => isDownloading = false;

  void setError(String errorMessage) {
    isError = true;
    isDownloading = false;
    this.errorMessage = errorMessage;
    logger.e(errorMessage);
  }

  Map<String, dynamic> toJson() {
    return {
      'isDownloading': isDownloading,
      'isError': isError,
      'errorMessage': errorMessage,
      'progress': progress,
      'downloadKey': downloadKey,
      'recieved': recieved,
      'size': size,
    };
  }

  void updateProgress(int totalReceived) {
    recieved = totalReceived;
    progress = totalReceived / size;
  }
}
