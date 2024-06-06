import 'dart:io';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/main.dart';
import 'package:blazedcloud/models/pocketbase/user.dart';
import 'package:blazedcloud/pages/settings/custom_babstrap/icon_style.dart'
    as babstrap;
import 'package:blazedcloud/pages/settings/custom_babstrap/settingsGroup.dart';
import 'package:blazedcloud/pages/settings/custom_babstrap/settingsItem.dart';
import 'package:blazedcloud/pages/sync/sync.dart';
import 'package:blazedcloud/providers/glassfy_providers.dart';
import 'package:blazedcloud/providers/pb_providers.dart';
import 'package:blazedcloud/providers/setting_providers.dart';
import 'package:blazedcloud/providers/sync_providers.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:blazedcloud/utils/generic_utils.dart';
import 'package:blazedcloud/utils/sync_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workmanager/workmanager.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  CustomSettingsItem? biometricSetting(WidgetRef ref) {
    return ref.watch(isBiometricAvailableProvider).when(data: (isAvailable) {
      if (isAvailable) {
        return CustomSettingsItem(
          onTap: () async {
            ref.read(isBiometricEnabledProvider.notifier).state =
                !ref.read(isBiometricEnabledProvider);
            final SharedPreferences buttonPrefs =
                await SharedPreferences.getInstance();
            await buttonPrefs.setBool(
                'biometric', !ref.read(isBiometricEnabledProvider));
          },
          icons: Icons.fingerprint,
          trailing: Switch(
            value: ref.watch(isBiometricEnabledProvider),
            onChanged: (value) async {
              ref.read(isBiometricEnabledProvider.notifier).state = value;
              final SharedPreferences buttonPrefs =
                  await SharedPreferences.getInstance();
              await buttonPrefs.setBool('biometric', value);
            },
          ),
          iconStyle: babstrap.IconStyle(),
          title: S.of(ref.context).requireBiometricsToOpenApp,
        );
      }
      return null;
    }, error: (err, stacktrace) {
      logger.e('Error checking biometric availability: $err');
      return null;
    }, loading: () {
      return null;
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(accountUserProvider(pb.authStore.model.id));
    final isPremium = ref.watch(premiumProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      backgroundColor: context.isDarkMode ? Colors.black : Colors.blueGrey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!Platform.isIOS)
                  CustomSettingsGroup(
                    settingsGroupTitle: S.of(context).general,
                    items: [
                      downloadLocationChangeSetting(context),
                    ],
                  ),
                CustomSettingsGroup(
                  settingsGroupTitle: S.of(context).security,
                  items: [
                    biometricSetting(ref),
                    passwordResetSetting(userData, context),
                    emailChangeSetting(userData, context),
                  ],
                ),
                if (Platform.isAndroid)
                  CustomSettingsGroup(
                    settingsGroupTitle: S.of(context).syncSettings,
                    items: [
                      if (Platform.isAndroid) syncPathSetting(ref, context),
                      if (ref.watch(cameraFolderProvider) != null)
                        syncEnabledSetting(ref),
                      if (ref.watch(cameraFolderProvider) != null)
                        syncAllowMeteredSetting(ref),
                      if (ref.watch(cameraFolderProvider) != null)
                        syncChargingOnlySetting(ref),
                      //syncFreqSetting(ref),
                    ],
                  ),
                CustomSettingsGroup(
                  settingsGroupTitle: S.of(context).account,
                  items: [
                    prunableSetting(userData, context, ref),
                    signOutSetting(ref.context),
                    deleteAccountSetting(context, isPremium),
                  ],
                ),
                CustomSettingsGroup(
                  items: [
                    githubSetting(context),
                    termsSetting(context),
                    privacyPolicySetting(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomSettingsItem deleteAccountSetting(
      BuildContext context, bool isPremium) {
    return CustomSettingsItem(
      onTap: () {
        // ask the user to confirm
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(S.of(context).deleteAccount),
              content:
                  Text(S.of(context).areYouSureYouWantToDeleteYourAccountThis),
              actions: [
                TextButton(
                  child: Text(S.of(context).cancel),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text(S.of(context).delete),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            );
          },
        ).then((value) {
          if (value != null) {
            // delete account
            try {
              Workmanager().cancelByUniqueName("folderSync");
              pb.collection('users').delete(pb.authStore.model.id).then((_) {
                SharedPreferences.getInstance().then((p) => p.clear());
                logger.i('User Deleted - Signing out');
                pb.authStore.clear();
                context.go('/landing');
              });

              // show dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(S.of(context).accountDeleted),
                    content: Text(S.of(context).yourAccountHasBeenDeleted),
                    actions: [
                      TextButton(
                        child: Text(S.of(context).ok),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  );
                },
              );
            } catch (e) {
              // show snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).failedToDeleteAccount),
                ),
              );
            }
          }
        });
      },
      icons: CupertinoIcons.delete_solid,
      title: S.of(context).deleteAccount,
      trailing: const SizedBox.shrink(),
      titleStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  CustomSettingsItem downloadLocationChangeSetting(BuildContext context) {
    return CustomSettingsItem(
      onTap: () {
        HapticFeedback.mediumImpact();
        promptForDownloadDirectory(context);
      },
      icons: CupertinoIcons.folder,
      trailing: const SizedBox.shrink(),
      iconStyle: babstrap.IconStyle(),
      title: S.of(context).changeDownloadLocation,
    );
  }

  CustomSettingsItem emailChangeSetting(
      AsyncValue<User> userData, BuildContext context) {
    return CustomSettingsItem(
      onTap: () {
        HapticFeedback.mediumImpact();
        userData.whenData((user) =>
            pb.collection('users').requestEmailChange(user.email).then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).requestSent)));
            }).onError((error, stackTrace) {
              logger.e("Error sending request: $error");
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).errorSendingRequest)));
              return null;
            }));
      },
      icons: CupertinoIcons.at,
      trailing: const SizedBox.shrink(),
      iconStyle: babstrap.IconStyle(),
      title: S.of(context).changeEmail,
      subtitle: S.of(context).willSendALinkToYourEmailToCompleteThe,
    );
  }

  CustomSettingsItem githubSetting(BuildContext context) {
    return CustomSettingsItem(
      onTap: () {
        final url = Uri.parse("https://github.com/TheRedSpy15/blazedcloud");
        canLaunchUrl(url).then((canLaunch) {
          if (canLaunch) {
            launchUrl(url);
          } else {
            logger.e("Can't launch url: $url");
          }
        });
      },
      icons: CupertinoIcons.doc_text,
      trailing: const SizedBox.shrink(),
      iconStyle: babstrap.IconStyle(),
      title: S.of(context).viewOnGithub,
    );
  }

  CustomSettingsItem passwordResetSetting(
      AsyncValue<User> userData, BuildContext context) {
    return CustomSettingsItem(
      onTap: () {
        HapticFeedback.mediumImpact();
        userData.whenData((user) => pb
                .collection('users')
                .requestPasswordReset(user.email)
                .then((value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(S.of(context).passwordResetEmailSent)));
            }).onError((error, stackTrace) {
              logger.e("Error sending password reset email: $error");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(S.of(context).errorSendingPasswordResetEmail)));
              return null;
            }));
      },
      icons: CupertinoIcons.lock_shield_fill,
      iconStyle: babstrap.IconStyle(),
      trailing: const SizedBox.shrink(),
      title: S.of(context).changePassword,
      subtitle: S.of(context).willSendALinkToYourEmailToResetYour,
    );
  }

  CustomSettingsItem privacyPolicySetting(BuildContext context) {
    return CustomSettingsItem(
      onTap: () {
        final url = Uri.parse("https://blazedcloud.com/privacy-policy/");
        canLaunchUrl(url).then((canLaunch) {
          if (canLaunch) {
            launchUrl(url);
          } else {
            logger.e("Can't launch url: $url");
          }
        });
      },
      icons: CupertinoIcons.doc_text,
      trailing: const SizedBox.shrink(),
      iconStyle: babstrap.IconStyle(),
      title: S.of(context).privacyPolicy,
    );
  }

  CustomSettingsItem? prunableSetting(
      AsyncValue<User> userData, BuildContext context, WidgetRef ref) {
    return userData.when(
      data: (user) {
        return CustomSettingsItem(
          onTap: () {
            HapticFeedback.mediumImpact();

            pb.collection('users').update(user.id, body: {
              "prunable": !user.prunable,
            }).then((value) {
              ref.invalidate(accountUserProvider(pb.authStore.model.id));
            }).onError((error, stackTrace) {
              logger.e("Error updating user: $error");
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text(S.of(context).errorUpdatingUserPleaseTryAgain)));
              return null;
            });
          },
          icons: CupertinoIcons.timer,
          trailing: Switch(
            value: user.prunable,
            onChanged: (value) {
              pb.collection('users').update(user.id, body: {
                "prunable": value,
              }).then((_) {
                ref.invalidate(accountUserProvider(pb.authStore.model.id));
              }).onError((error, stackTrace) {
                logger.e("Error updating user: $error");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text(S.of(context).errorUpdatingUserPleaseTryAgain)));
                return null;
              });
            },
          ),
          iconStyle: babstrap.IconStyle(backgroundColor: Colors.red),
          title: S.of(context).autoDeleteAcount,
          subtitle:
              S.of(context).deleteYourAccountAfter90DaysOfInactivityUsersWith,
        );
      },
      loading: () => null,
      error: (err, stack) {
        logger.e("Error getting user: $err");
        return null;
      },
    );
  }

  CustomSettingsItem signOutSetting(BuildContext context) {
    return CustomSettingsItem(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(S.of(context).signOut),
              content: Text(S.of(context).areYouSureYouWantToSignOut),
              actions: [
                TextButton(
                  child: Text(S.of(context).cancel),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text(S.of(context).signOut),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            );
          },
        ).then((value) {
          if (value != null) {
            logger.i('Signing out');
            try {
              Workmanager().cancelByUniqueName("folderSync");
              pb.authStore.clear();
              SharedPreferences.getInstance()
                  .then((p) => p.clear().then((_) => context.go('/landing')));
            } catch (e) {
              logger.e('Error signing out: $e');
            }
          }
        });
      },
      icons: Icons.exit_to_app_rounded,
      trailing: const SizedBox.shrink(),
      title: S.of(context).signOut,
    );
  }

  CustomSettingsItem syncAllowMeteredSetting(WidgetRef ref) {
    return CustomSettingsItem(
      onTap: () async {
        ref.read(allowMeteredProvider.notifier).state =
            !ref.read(allowMeteredProvider);
        final SharedPreferences buttonPrefs =
            await SharedPreferences.getInstance();
        await buttonPrefs.setBool(
            'allowMetered', !ref.read(allowMeteredProvider));

        updateSyncWorkerWithRef(ref);
      },
      icons: Icons.cell_tower,
      trailing: Switch(
        value: ref.watch(allowMeteredProvider),
        onChanged: (value) async {
          ref.read(allowMeteredProvider.notifier).state = value;
          final SharedPreferences buttonPrefs =
              await SharedPreferences.getInstance();
          await buttonPrefs.setBool('allowMetered', value);

          updateSyncWorkerWithRef(ref);
        },
      ),
      iconStyle: babstrap.IconStyle(),
      title: S.of(ref.context).allowMeteredConnections,
    );
  }

  CustomSettingsItem? syncChargingOnlySetting(WidgetRef ref) {
    return CustomSettingsItem(
      onTap: () async {
        ref.read(requireChargingProvider.notifier).state =
            !ref.read(requireChargingProvider);
        final SharedPreferences buttonPrefs =
            await SharedPreferences.getInstance();
        await buttonPrefs.setBool(
            'requireCharging', !ref.read(requireChargingProvider));

        updateSyncWorkerWithRef(ref);
      },
      icons: Icons.power,
      trailing: Switch(
        value: ref.watch(requireChargingProvider),
        onChanged: (value) async {
          ref.read(requireChargingProvider.notifier).state = value;
          final SharedPreferences buttonPrefs =
              await SharedPreferences.getInstance();
          await buttonPrefs.setBool('requireCharging', value);

          updateSyncWorkerWithRef(ref);
        },
      ),
      iconStyle: babstrap.IconStyle(),
      title: S.of(ref.context).requireCharging,
    );
  }

  CustomSettingsItem? syncEnabledSetting(WidgetRef ref) {
    return CustomSettingsItem(
      onTap: () async {
        ref.read(watchEnabledProvider.notifier).state =
            !ref.read(watchEnabledProvider);
        final SharedPreferences buttonPrefs =
            await SharedPreferences.getInstance();
        await buttonPrefs.setBool(
            'isWatching', !ref.read(allowMeteredProvider));

        updateSyncWorkerWithRef(ref);
      },
      icons: Icons.cloud_sync,
      trailing: Switch(
        value: ref.watch(watchEnabledProvider),
        onChanged: (value) async {
          ref.read(watchEnabledProvider.notifier).state = value;
          final SharedPreferences buttonPrefs =
              await SharedPreferences.getInstance();
          await buttonPrefs.setBool('isWatching', value);

          updateSyncWorkerWithRef(ref);
        },
      ),
      iconStyle: babstrap.IconStyle(),
      title: S.of(ref.context).syncEnabled,
    );
  }

  CustomSettingsItem? syncFreqSetting(WidgetRef ref) {
    throw UnimplementedError(); // wait for next release
  }

  CustomSettingsItem? syncPathSetting(WidgetRef ref, BuildContext context) {
    final cameraRoll = ref.watch(cameraFolderProvider);
    return CustomSettingsItem(
      onTap: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(S.of(context).cameraRollSync),
                content: Wrap(
                  children: [
                    Text(S.of(context).camSyncDesc),
                    if (cameraRoll != null) Text(cameraRoll.path),
                  ],
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
                      setCameraRoll(ref);
                      Navigator.of(context).pop();
                    },
                    child: Text(S.of(context).selectSyncLocation),
                  ),
                ],
              );
            });
      },
      icons: Icons.camera_alt,
      trailing: const Icon(Icons.arrow_forward_ios),
      iconStyle: babstrap.IconStyle(),
      title: S.of(ref.context).cameraRollSync,
      subtitle: cameraRoll?.path,
    );
  }

  CustomSettingsItem termsSetting(BuildContext context) {
    return CustomSettingsItem(
      onTap: () => viewToS(),
      icons: CupertinoIcons.doc_text,
      trailing: const SizedBox.shrink(),
      iconStyle: babstrap.IconStyle(),
      title: S.of(context).termsOfService,
    );
  }
}
