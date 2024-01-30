import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/providers/sync_providers.dart';
import 'package:blazedcloud/utils/sync_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final isAuthenticatedProvider = StateProvider<bool>((ref) {
  return false;
});

final isBiometricAvailableProvider = FutureProvider.autoDispose<bool>((ref) {
  final isSupported = LocalAuthentication().isDeviceSupported();
  final canCheck = LocalAuthentication().canCheckBiometrics;
  final savedBiometrics = LocalAuthentication().getAvailableBiometrics();

  return Future.wait([isSupported, savedBiometrics, canCheck]).then((value) {
    final isSupported = value[0] as bool;
    final savedBiometrics = value[1] as List<BiometricType>;
    final canCheck = value[2] as bool;
    return isSupported && savedBiometrics.isNotEmpty && canCheck;
  });
});

final isBiometricEnabledProvider = StateProvider<bool>((ref) {
  return false;
});

final isPrefsLoaded = FutureProvider.autoDispose<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();

  ref.read(isBiometricEnabledProvider.notifier).state =
      prefs.getBool('biometric') ?? false;
  ref.read(watchEnabledProvider.notifier).state =
      prefs.getBool('isWatching') ?? true;
  ref.read(syncFrequencyProvider.notifier).state =
      prefs.getInt('syncFrequency') ?? 30;
  ref.read(allowMeteredProvider.notifier).state =
      prefs.getBool('allowMetered') ?? false;
  ref.read(requireChargingProvider.notifier).state =
      prefs.getBool('requireCharging') ?? false;

  // we load the folders to watch here to consolidate the logic
  ref.read(foldersToWatchProvider.notifier).state = await getFoldersForSync();
  updateSyncWorker(
      pb.authStore.model.id,
      pb.authStore.token,
      ref.read(allowMeteredProvider),
      ref.read(requireChargingProvider),
      ref.read(syncFrequencyProvider),
      ref.read(watchEnabledProvider));

  return true;
});
