import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final allowedEmailDomainsProvider = FutureProvider<List<String>>((ref) async {
  final allowedDomains = await getAllowedEmailDomains();
  return allowedDomains;
});
final emailController = TextEditingController();
final isAttemptingSignupProvider = StateProvider<bool>((ref) => false);
final passwordController = TextEditingController();
final showClearPasword = StateProvider<bool>((ref) => false);

class SignUpScreen extends ConsumerWidget {
  final passwordMinLength = 8;
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signUp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Wrap(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).createAnAccount,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),

                      // Email Input
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: S.of(context).email,
                          ),
                        ),
                      ),

                      // Password Input
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !ref.watch(showClearPasword),
                          enableSuggestions: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: S.of(context).password,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.remove_red_eye),
                              onPressed: () {
                                ref.read(showClearPasword.notifier).state =
                                    !ref.read(showClearPasword);
                              },
                            ),
                          ),
                        ),
                      ),

                      // signup Button
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              Theme.of(context).splashColor),
                        ),
                        onPressed: ref.watch(isAttemptingSignupProvider)
                            ? null
                            : () {
                                if (ref.read(isAttemptingSignupProvider)) {
                                  return;
                                }
                                ref
                                    .read(isAttemptingSignupProvider.notifier)
                                    .state = true;

                                ref
                                    .watch(allowedEmailDomainsProvider)
                                    .whenData((domains) {
                                  if (!isValidEmail(
                                      emailController.text, domains)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(S
                                                .of(context)
                                                .emailDomainNotAllowed)));
                                    ref
                                        .read(
                                            isAttemptingSignupProvider.notifier)
                                        .state = false;
                                    return;
                                  }
                                  if (!isValidPassword(
                                      passwordController.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(S
                                                .of(context)
                                                .passwordMustBePasswordminlengthCharactersLong(
                                                    passwordMinLength))));
                                    ref
                                        .read(
                                            isAttemptingSignupProvider.notifier)
                                        .state = false;
                                    return;
                                  }

                                  createAccount(context);
                                  ref
                                      .read(isAttemptingSignupProvider.notifier)
                                      .state = false;
                                });
                              },
                        child: Text(S.of(context).signUp),
                      ),

                      ref.watch(allowedEmailDomainsProvider).when(
                            data: (allowedDomains) {
                              if (allowedDomains.isEmpty) {
                                return const SizedBox.shrink();
                              }
                              return TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              Text(S.of(context).allowedEmails),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Text(allowedDomains.join("\n")),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(S.of(context).close),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child:
                                    Text(S.of(context).viewAllowedEmailDomains),
                              );
                            },
                            loading: () => const SizedBox.shrink(),
                            error: (error, stackTrace) {
                              logger.e(error);
                              return const Text(
                                  "Error loading allowed domains");
                            },
                          )
                    ],
                  ),
                ),
              ),
            ],
          ),
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
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).failedLogingInAfterSignup)));
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

    // if no allowed domains, then any domain is allowed
    if (allowedDomains.isEmpty) {
      return true;
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
