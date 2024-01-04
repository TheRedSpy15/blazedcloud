import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/controllers/download_controller.dart';
import 'package:blazedcloud/controllers/upload_controller.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/pages/dashboard.dart';
import 'package:blazedcloud/pages/login/locked.dart';
import 'package:blazedcloud/pages/login/login.dart';
import 'package:blazedcloud/pages/login/signup.dart';
import 'package:blazedcloud/providers/pb_providers.dart';
import 'package:blazedcloud/providers/setting_providers.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:workmanager/workmanager.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    logger.i("Initializing Glassfy");
    await Glassfy.initialize('e7e4e5d11b2f48169f26e930a660862b',
        watcherMode: false);
    logger.i("Glassfy initialized");
  } catch (e) {
    logger.w("Glassfy failed to initialize: $e");
  }

  await Hive.initFlutter();

  await Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          kDebugMode // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );

  runApp(const MyApp());
}

// GoRouter configuration
final _router = GoRouter(
  initialLocation: '/landing',
  routes: [
    GoRoute(
      path: '/landing',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      name: "login",
      path: '/landing/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: "signup",
      path: '/landing/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: "locked",
      path: '/locked',
      builder: (context, state) => const LockedScreen(),
    ),
    GoRoute(
      name: "dashboard",
      path: '/dashboard',
      builder: (context, state) => const Dashboard(),
    ),
  ],
);

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    logger.d("Native called background task: $task");

    if (task == "download") {
      return await DownloadController.startDownload(
          inputData?['uid'],
          inputData?['fileKey'],
          inputData?['token'],
          inputData?['exportDir'],
          inputData?['startDate']);
    } else if (task == "upload") {
      return await UploadController.startUpload(
          inputData?['uid'],
          inputData?['localPath'],
          inputData?['localName'],
          inputData?['size'],
          inputData?['s3Directory'],
          inputData?['token'],
          inputData?['startDate']);
    }

    return Future.value(true);
  });
}

class LandingContent extends StatelessWidget {
  const LandingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(S.of(context).appName,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
          Lottie.asset("assets/lottie/fire.json", repeat: true),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('login');
            },
            style: const ButtonStyle(),
            child: Text(
              S.of(context).login,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('signup');
            },
            style: const ButtonStyle(),
            child: Text(
              S.of(context).signUp,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    ));
  }
}

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(healthCheckProvider).when(
      data: (data) {
        return ref.watch(savedAuthProvider).when(
          data: (data) {
            if (data) {
              logger.d("Token is valid. User: ${pb.authStore.model.id}");
              return ref.watch(isPrefsLoaded).when(data: (isLoaded) {
                if (isLoaded) {
                  return ref.read(isBiometricEnabledProvider)
                      ? ref.read(isAuthenticatedProvider)
                          ? const Dashboard()
                          : const LockedScreen()
                      : const Dashboard();
                }
                return const Dashboard();
              }, error: (err, stack) {
                logger.e("Error loading prefs: $err");
                return const Dashboard();
              }, loading: () {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              });
            } else {
              return const LandingContent();
            }
          },
          loading: () {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          error: (err, stack) {
            logger.i("Error loading saved auth: $err");

            // clear saved auth
            Hive.deleteBoxFromDisk('vaultBox');
            const FlutterSecureStorage().delete(key: 'key');

            return const LandingContent();
          },
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (err, stack) {
        logger.e("Server Health check failed: $err");
        return FutureBuilder(
            future: getExportDirectoryFromHive(),
            builder: (context, snapshot) {
              return Scaffold(
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: [
                            Column(
                              children: [
                                Text(S.of(context).serverMaintenance),
                                if (snapshot.hasData && snapshot.data != '')
                                  Text(S
                                      .of(context)
                                      .offlineFilesAreStoredAtSnapshotdata(
                                          snapshot.data ?? '')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        /* dark theme settings */
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    ));
  }
}

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
