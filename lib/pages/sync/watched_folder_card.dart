import 'dart:convert';

import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/sync/folder_to_watch.dart';
import 'package:blazedcloud/providers/sync_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatcherFolderCard extends ConsumerWidget {
  final FolderToWatch folder;
  const WatcherFolderCard({super.key, required this.folder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.all(4.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                folder.folderName,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text("Mode: ${folder.mode}"),
              Text("Last Synced: ${folder.getLastSyncedIntl()}"),
              Text("Local: ${folder.folderPath}"),
              Text("Remote: ${removeUid(folder.remoteFolderKey)}"),
            ],
          ),
        ),
      ),
      onTap: () {
        // ask the user if they want to remove the folder
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Remove Folder"),
                content: const Text(
                    "Are you sure you want to remove this folder from being watched?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        // remove from shared prefs
                        SharedPreferences.getInstance().then((prefs) {
                          final foldersToWatch =
                              prefs.getStringList("foldersToWatch") ??
                                  List.empty();
                          foldersToWatch.removeWhere((element) =>
                              FolderToWatch.fromJson(Map<String, dynamic>.from(
                                      jsonDecode(element)))
                                  .folderPath ==
                              folder.folderPath);
                          prefs.setStringList(
                              "foldersToWatch", foldersToWatch.cast<String>());
                        });

                        // remove from the UI
                        try {
                          ref.invalidate(foldersToWatchProvider);
                        } catch (e) {
                          // likely to through error if ref is disposed
                          logger.e("Error updating UI: $e");
                        }
                        Navigator.of(context).pop();
                      },
                      child: const Text("Remove"))
                ],
              );
            });
      },
    );
  }

  String removeUid(String path) {
    final uid = path.split("/").first;
    return path.replaceFirst("$uid/", "");
  }
}
