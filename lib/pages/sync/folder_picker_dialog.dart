import 'package:blazedcloud/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newFolderWatchMode = StateProvider<String>((ref) {
  return "complete";
});

class FolderWatchPickerDialogContent extends ConsumerWidget {
  const FolderWatchPickerDialogContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      children: [
        Column(
          children: [
            // dropdown for sync mode
            DropdownButton(
              value: ref.watch(newFolderWatchMode),
              onChanged: (String? value) {
                ref.read(newFolderWatchMode.notifier).state =
                    value ?? "complete";
              },
              items: const [
                DropdownMenuItem(
                  value: "upload",
                  child: Text("Upload Only"),
                ),
                DropdownMenuItem(
                  value: "download",
                  child: Text("Download Only"),
                ),
                DropdownMenuItem(
                  value: "complete",
                  child: Text("Complete Sync"),
                ),
              ],
            ),
            Text(S.of(context).currentlyNestedFoldersAreNotSupported)
          ],
        ),
      ],
    );
  }
}
