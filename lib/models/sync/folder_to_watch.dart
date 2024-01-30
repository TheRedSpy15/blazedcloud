import 'dart:io';

class FolderToWatch {
  String folderName;
  String folderPath;
  String remoteFolderKey;
  String? lastSynced;

  /// possible values: upload, download, complete
  ///
  /// String instead of enum to allow serialization with shared_preferences
  String mode;

  FolderToWatch({
    required this.folderName,
    required this.folderPath,
    required this.remoteFolderKey,
    required this.lastSynced,
    required this.mode,
  });

  factory FolderToWatch.fromJson(Map<String, dynamic> json) {
    return FolderToWatch(
      folderName: json['folderName'],
      folderPath: json['folderPath'],
      remoteFolderKey: json['remoteFolderKey'],
      lastSynced: json['lastSynced'],
      mode: json['mode'],
    );
  }

  bool canAccess() {
    return Directory(folderPath).existsSync();
  }

  String getLastSyncedIntl() {
    if (lastSynced == null) {
      return "Never";
    }

    final DateTime? lastSyncedDateTime = DateTime.tryParse(lastSynced!);
    return lastSyncedDateTime!.toLocal().toString();
  }

  /// TODO: implement this
  bool isSynced() {
    return false;
  }

  Map<String, dynamic> toJson() => {
        'folderName': folderName,
        'folderPath': folderPath,
        'remoteFolderKey': remoteFolderKey,
        'lastSynced': lastSynced,
        'mode': mode,
      };
}
