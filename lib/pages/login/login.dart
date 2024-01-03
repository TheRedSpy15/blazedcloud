import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final emailController = TextEditingController();
final isAttemptingLoginProvider = StateProvider<bool>((ref) => false);

final passwordController = TextEditingController();

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).login),
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
                decoration: InputDecoration(
                  labelText: S.of(context).email,
                ),
              ),
            ),

            // Password Input
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: S.of(context).password,
                ),
              ),
            ),

            // Login Button
            ElevatedButton(
              onPressed: ref.watch(isAttemptingLoginProvider)
                  ? null
                  : () {
                      if (ref.read(isAttemptingLoginProvider)) {
                        return;
                      }
                      ref.read(isAttemptingLoginProvider.notifier).state = true;

                      // attempt login with pocketbase
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
                      }).onError((error, stackTrace) {
                        logger.e("Error logging in: $error");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text(S.of(context).invalidEmailOrPassword)));
                        ref.read(isAttemptingLoginProvider.notifier).state =
                            false;
                        return null;
                      });

                      ref.read(isAttemptingLoginProvider.notifier).state =
                          false;
                    },
              child: Text(S.of(context).login),
            ),

            // password reset button
            TextButton(
              onPressed: () {
                showPasswordResetDialog(context);
              },
              child: Text(S.of(context).forgotPassword),
            ),
          ],
        ),
      ),
    );
  }

  void showPasswordResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).resetPassword),
        content: TextField(
          decoration: InputDecoration(
            labelText: S.of(context).email,
          ),
          onChanged: (value) {
            emailController.text = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              // send password reset email
              pb
                  .collection('users')
                  .requestPasswordReset(emailController.text)
                  .then((value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(S.of(context).passwordResetEmailSent)));
                Navigator.of(context).pop();
              }).onError((error, stackTrace) {
                logger.e("Error sending password reset email: $error");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text(S.of(context).errorSendingPasswordResetEmail)));
                return null;
              });
            },
            child: Text(S.of(context).send),
          ),
        ],
      ),
    );
  }
}
