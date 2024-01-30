import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/pocketbase/authstore.dart';
import 'package:blazedcloud/models/pocketbase/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

final accountUserProvider =
    FutureProvider.family<User, String>((ref, id) async {
  return ref.read(userProvider).getUser(id);
});

final healthCheckProvider = FutureProvider.autoDispose<bool>((ref) async {
  final health = await pb.health.check();
  logger.i("Health check result: $health");
  return health.code == 200;
});

final savedAuthProvider = FutureProvider.autoDispose<bool>((ref) async {
  final customAuth = CustomAuthStore();

  final auth = await customAuth.loadAuth();
  if (auth != null) {
    pb = PocketBase(backendUrl, authStore: auth);
    if (pb.authStore.isValid) {
      logger.i("Token is valid. User: ${pb.authStore.model.id}");
    }
  } else {
    logger.i("No saved auth");
  }

  return auth != null && pb.authStore.isValid;
});

final userProvider = Provider<User>((ref) => User());
