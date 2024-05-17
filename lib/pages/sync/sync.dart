import 'dart:io';

import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/providers/sync_providers.dart';
import 'package:blazedcloud/utils/sync_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final syncForcedProvider = StateProvider<bool>((ref) {
  return false;
});

void setCameraRoll(WidgetRef ref) async {
  if (!await getSyncPermissions()) {
    return;
  }

  final dir = FilePicker.platform.getDirectoryPath();
  dir.then((value) {
    if (value != null) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString("cameraFolder", value);
      });
      ref.read(cameraFolderProvider.notifier).state = Directory(value);
    }
  });
}

class CameraRollSetupCard extends ConsumerWidget {
  const CameraRollSetupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Column(
                children: [
                  Text(
                    S.of(context).cameraRollSync,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(S.of(context).camSyncDesc, textAlign: TextAlign.center),
                  OutlinedButton(
                      onPressed: () => setCameraRoll(ref),
                      child: Text(S.of(context).selectSyncLocation))
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class SyncPage extends ConsumerWidget {
  const SyncPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraRoll = ref.watch(cameraFolderProvider);

    return Scaffold(
        body: cameraRoll == null
            ? const CameraRollSetupCard()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                                S
                                    .of(context)
                                    .periodicallyBackingUpSelectedFolder,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700)),
                            Text(cameraRoll.path),
                            OutlinedButton(
                                onPressed: () => setCameraRoll(ref),
                                child: Text(S.of(context).changeSyncPath)),
                            OutlinedButton(
                                onPressed: () {
                                  syncFolders(pb.authStore.model.id,
                                      pb.authStore.token);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(S.of(context).syncing),
                                      duration: const Duration(seconds: 5),
                                    ),
                                  );
                                },
                                child: Text(S.of(context).syncNow)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
  }
}
