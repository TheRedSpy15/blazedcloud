class UploadState {
  bool isUploading;
  bool isError;
  String? errorMessage;
  double progress;
  String uploadKey;
  int sent = 0;
  int size = 0;

  UploadState({
    required this.isUploading,
    required this.isError,
    this.errorMessage,
    this.progress = 0.0,
    required this.uploadKey,
    required this.sent,
    required this.size,
  });

  factory UploadState.error(String errorMessage) => UploadState(
        isUploading: false,
        isError: true,
        errorMessage: errorMessage,
        uploadKey: '',
        size: 0,
        sent: 0,
      );
  factory UploadState.fromJson(Map<String, dynamic> json) {
    return UploadState(
      isUploading: json['isUploading'] ?? false,
      isError: json['isError'] ?? false,
      errorMessage: json['errorMessage'],
      progress: json['progress'] ?? 0.0,
      uploadKey: json['uploadKey'] ?? '',
      sent: json['sent'] ?? 0,
      size: json['size'] ?? 0,
    );
  }

  void completed() {
    isUploading = false;
    isError = false;
    progress = 1.0;
  }

  void setError(String errorMessage) {
    isError = true;
    isUploading = false;
    this.errorMessage = errorMessage;
  }

  Map<String, dynamic> toJson() {
    return {
      'isUploading': isUploading,
      'isError': isError,
      'errorMessage': errorMessage,
      'progress': progress,
      'uploadKey': uploadKey,
      'sent': sent,
      'size': size,
    };
  }

  void updateTotalSent(int totalSent) {
    sent = totalSent;
    progress = sent / size;
  }
}
