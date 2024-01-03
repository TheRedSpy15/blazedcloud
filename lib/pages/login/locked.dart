import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/providers/setting_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';

class LockedScreen extends ConsumerWidget {
  const LockedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).authenticationRequired,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const Text(
                "Saved files are still visisble in export folder",
                textAlign: TextAlign.center,
              ),
              Lottie.asset("assets/lottie/locked.json", repeat: false),
              ElevatedButton(
                onPressed: () {
                  try {
                    final LocalAuthentication auth = LocalAuthentication();
                    auth
                        .authenticate(
                            localizedReason:
                                'Please authenticate to access your cloud',
                            options: const AuthenticationOptions(
                                useErrorDialogs: false))
                        .then((didAuthenticate) {
                      ref.read(isAuthenticatedProvider.notifier).state =
                          didAuthenticate;
                      if (didAuthenticate) {
                        context.go('/dashboard');
                      }
                    });
                  } catch (e) {
                    logger.e("Error authenticating: $e");
                  }
                },
                child: const Icon(
                  Icons.fingerprint,
                  size: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
