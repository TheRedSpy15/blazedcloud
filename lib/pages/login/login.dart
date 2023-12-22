import 'package:blazedcloud/constants.dart';
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
        title: const Text('Login'),
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
              onPressed: () {
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
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid email or password")));
                  return null;
                });

                ref.read(isAttemptingLoginProvider.notifier).state = false;
              },
              child: const Text('Login'),
            ),

            // password reset button
            TextButton(
              onPressed: () {
                showPasswordResetDialog(context);
              },
              child: const Text('Forgot password?'),
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
        title: const Text('Reset password'),
        content: TextField(
          decoration: const InputDecoration(
            labelText: 'Email',
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
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // send password reset email
              pb
                  .collection('users')
                  .requestPasswordReset(emailController.text)
                  .then((value) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Password reset email sent!")));
                Navigator.of(context).pop();
              }).onError((error, stackTrace) {
                logger.e("Error sending password reset email: $error");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Error sending password reset email")));
                return null;
              });
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}
