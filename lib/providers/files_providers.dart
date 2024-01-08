import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/models/files_api/list_files.dart';
import 'package:blazedcloud/providers/pb_providers.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:blazedcloud/utils/user_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final combinedDataProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, String>((ref, userId) async {
  final usage = await ref.read(usageProvider.future);
  final user = await ref.read(accountUserProvider(userId).future);

  return {
    'usage': usage,
    'isTerabyteActive': user.terabyte_active,
    'stripeActive': user.stripe_active,
    'capacity': getTotalGigCapacity(user),
  };
});

final currentDirectoryProvider =
    StateProvider<String>((ref) => pb.authStore.model.id + '/');

/// pass the directory to list files from (folder key). Use empty string for root
final fileListProvider =
    FutureProvider.family<ListBucketResult, String>((ref, folder) async {
  return getFilelistByFolder(pb.authStore.model.id, folder, pb.authStore.token);
});

/// provides a list of keys to search through. includes all files and folders
final searchKeysProvider = FutureProvider<List<String>>((ref) async {
  return getSearchList(pb.authStore.model.id, pb.authStore.token);
});

/// byte usage from /data/usage/{user id}
final usageProvider = FutureProvider.autoDispose<int>((ref) async {
  return getUsage(pb.authStore.model.id, pb.authStore.token);
});
