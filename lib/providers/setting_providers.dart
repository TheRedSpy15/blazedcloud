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
  return true;
});
