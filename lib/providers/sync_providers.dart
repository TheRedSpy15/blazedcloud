import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final allowMeteredProvider = StateProvider<bool>((ref) {
  return false;
});

final cameraFolderProvider = StateProvider<Directory?>((ref) {
  return null;
});

//final cameraListProvider =
//    FutureProvider.autoDispose.family<List<String>, int>((ref, page) async {
//  return getCameraSyncList(pb.authStore.model.id, pb.authStore.token);
//});

final cameraRollPageProvider = StateProvider<int>((ref) {
  return 0;
});

final lastSyncProvider = StateProvider<DateTime>((ref) {
  return DateTime(0);
});

final nextSyncProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final requireChargingProvider = StateProvider<bool>((ref) {
  return false;
});

/// frequency in minutes
//final syncFrequencyProvider = StateProvider<int>((ref) {
//  return 360;
//});

final watchEnabledProvider = StateProvider<bool>((ref) {
  return true;
});
