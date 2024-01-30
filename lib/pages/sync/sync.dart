import 'package:blazedcloud/pages/sync/watched_folder_card.dart';
import 'package:blazedcloud/providers/sync_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SyncPage extends ConsumerWidget {
  const SyncPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folders = ref.watch(foldersToWatchProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Watched Folders"),
        ),
        body: folders.isEmpty
            ? const Center(
                child: Text(
                    "Add a folder from the file page to automatically sync"))
            : ListView.builder(
                itemCount: folders.length,
                itemBuilder: (context, index) {
                  final folder = folders[index];
                  return WatcherFolderCard(folder: folder);
                }));
  }
}
