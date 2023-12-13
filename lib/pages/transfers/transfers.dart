import 'package:blazedcloud/models/transfers/download_state.dart';
import 'package:blazedcloud/models/transfers/upload_state.dart';
import 'package:blazedcloud/pages/transfers/usage_card.dart';
import 'package:blazedcloud/providers/transfers_providers.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransfersPage extends ConsumerWidget {
  const TransfersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadStates = ref.watch(downloadStateProvider);
    final uploadStates = ref.watch(uploadStateProvider);
    final transfers = [...downloadStates, ...uploadStates];

    return ListView.builder(
      itemCount: transfers.length + 1,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // display usage card at the top of the list
        if (index == 0) {
          return const UsageCard();
        }

        final transfer = transfers[index - 1];

        if (transfer is DownloadState) {
          return Card(
            child: ListTile(
              title: Text(getFileName(transfer.downloadKey)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Progress: ${(transfer.progress * 100).toStringAsFixed(2)}%'),
                  transfer.isError
                      ? Text('Error: ${transfer.errorMessage}')
                      : transfer.isDownloading
                          ? const Text('Downloading...')
                          : const Text('Downloaded'),
                ],
              ),
              leading: const Icon(Icons.download_rounded),
            ),
          );
        } else if (transfer is UploadState) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.upload_rounded),
              title: Text(getFileName(transfer.uploadKey)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Progress: ${(transfer.progress * 100).toStringAsFixed(2)}%'),
                  transfer.isError
                      ? Text('Error: ${transfer.errorMessage}')
                      : transfer.isUploading
                          ? const Text('Uploading...')
                          : const Text('Uploaded'),
                ],
              ),
            ),
          );
        }
        return null;
      },
    );
  }
}
