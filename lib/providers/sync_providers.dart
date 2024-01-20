import 'package:blazedcloud/models/sync/folder_to_watch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allowMeteredProvider = StateProvider<bool>((ref) {
  return false;
});

final foldersToWatchProvider = StateProvider<List<FolderToWatch>>((ref) {
  return [];
});

final lastSyncProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final nextSyncProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final requireChargingProvider = StateProvider<bool>((ref) {
  return false;
});

/// frequency in minutes
final syncFrequencyProvider = StateProvider<int>((ref) {
  return 0;
});

final watchEnabledProvider = StateProvider<bool>((ref) {
  return false;
});
