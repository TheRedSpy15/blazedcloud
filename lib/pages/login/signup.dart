import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_snitch/github_snitch.dart';
import 'package:go_router/go_router.dart';

final emailController = TextEditingController();
final isAttemptingSignupProvider = StateProvider<bool>((ref) => false);

final passwordController = TextEditingController();

class SignUpScreen extends ConsumerWidget {
  final passwordMinLength = 8;
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Input
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),

            // Password Input
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),

            // Login Button
            ElevatedButton(
              onPressed: ref.watch(isAttemptingSignupProvider)
                  ? null
                  : () {
                      if (ref.read(isAttemptingSignupProvider)) {
                        return;
                      }
                      ref.read(isAttemptingSignupProvider.notifier).state =
                          true;

                      getAllowedEmailDomains().then((domains) {
                        if (!isValidEmail(emailController.text, domains)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Invalid email domain")));
                          ref.read(isAttemptingSignupProvider.notifier).state =
                              false;
                          return;
                        }
                        if (!isValidPassword(passwordController.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Password must be $passwordMinLength characters long")));
                          ref.read(isAttemptingSignupProvider.notifier).state =
                              false;
                          return;
                        }

                        createAccount(context);
                        ref.read(isAttemptingSignupProvider.notifier).state =
                            false;
                      });
                    },
              child: const Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a new user then logs them in
  void createAccount(BuildContext context) {
    final body = <String, dynamic>{
      "email": emailController.text,
      "emailVisibility": false,
      "password": passwordController.text,
      "passwordConfirm": passwordController.text,
      "active": false,
      "usingPersonalEncryption": false
    };

    try {
      pb.collection('users').create(body: body).then((value) {
        pb.collection('users').requestVerification(emailController.text);

        // we need to login now after creating the user
        pb
            .collection('users')
            .authWithPassword(
              emailController.text,
              passwordController.text,
            )
            .then((value) {
          pb.authStore.save(value.token, value.record);

          if (pb.authStore.isValid) {
            context.go('/dashboard');
          }
        });
      }).onError((error, stackTrace) {
        logger.e(error);
        GhSnitch.report(
            title: "Failed Login after Signup", body: error.toString());
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed loging in after signup")));
        return Future.value(null);
      });
    } catch (e) {
      logger.e(e);
    }
  }

  bool isValidEmail(String email, List<String> allowedDomains) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(email)) {
      return false;
    }

    for (var domain in allowedDomains) {
      if (email.endsWith(domain)) {
        return true;
      }
    }
    return false;
  }

  bool isValidPassword(String password) {
    return password.length >= passwordMinLength;
  }
}
