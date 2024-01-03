import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/controllers/download_controller.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:blazedcloud/providers/transfers_providers.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final isFileOffline =
    FutureProvider.autoDispose.family<bool, String>((ref, filename) async {
  return isFileSavedOffline(filename);
});

final shareDurationProvider = StateProvider<int>((ref) => 60);

void deleteItem(String fileKey, BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(S.of(context).deleteFile),
      content: Text(S.of(context).areYouSureYouWantToDeleteThisFile),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            // Handle delete action here
            logger.i('Deleting $fileKey');
            Navigator.of(context).pop();
            deleteFile(pb.authStore.model.id, fileKey, pb.authStore.token)
                .then((_) {
              String folder = getFolderFromKey(fileKey);
              ref.invalidate(fileListProvider(folder));
            });
          },
          child: Text(S.of(context).delete),
        ),
      ],
    ),
  );
}

void downloadItem(String fileKey, DownloadController downloadController,
    BuildContext context) {
  checkIfAccessToDownloadDirectoryIsGranted().then((granted) {
    if (!granted) {
      promptForDownloadDirectory(context);
    } else if (granted) {
      downloadController.queueDownload(pb.authStore.model.id, fileKey);
      HapticFeedback.vibrate();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S
              .of(context)
              .downloadingGetfilenamefilekey(getFileName(fileKey))),
        ),
      );
    }
  });
}

void openFromOffline(String fileKey, WidgetRef ref) {
  getOfflineFile(fileKey).then((file) {
    try {
      logger.i('Opening file: ${file.path}');
      ScaffoldMessenger.of(ref.context).showSnackBar(
        SnackBar(
          content: Text(S
              .of(ref.context)
              .openingFileGetfilenamefilekey(getFileName(fileKey))),
        ),
      );
      openFile(file);
    } catch (e) {
      logger.e('Error opening file: $e');
      ScaffoldMessenger.of(ref.context).showSnackBar(
        SnackBar(
          content: Text(S.of(ref.context).errorOpeningFileE),
        ),
      );
    }
  });
}

void openFromUrl(String fileKey, WidgetRef ref) {
  logger.i("Attempting to open file from url \n $fileKey");

  getFileLink(pb.authStore.model.id, fileKey, pb.authStore.token).then((link) {
    canLaunchUrl(Uri.parse(link)).then((canLaunch) {
      if (canLaunch) {
        ScaffoldMessenger.of(ref.context).showSnackBar(
          SnackBar(
            content: Text(S.of(ref.context).openingInBrowser),
          ),
        );
        launchUrl(Uri.parse(link));
      } else {
        logger.e('Could not launch url: $link');
        ScaffoldMessenger.of(ref.context).showSnackBar(
          SnackBar(
            content:
                Text(S.of(ref.context).failedToOpenPleaseTrySavingTheFileFirst),
          ),
        );
      }
    });
  });
}

void openItem(String fileKey, WidgetRef ref) {
  isFileSavedOffline(fileKey).then((isOffline) {
    if (isOffline &&
        !isFileBeingDownloaded(fileKey, ref.read(downloadStateProvider))) {
      openFromOffline(fileKey, ref);
    } else if (getFileType(fileKey) == FileType.image ||
        getFileType(fileKey) == FileType.video) {
      openFromUrl(fileKey, ref);
    } else {
      logger.i('File $fileKey is not available offline');
      ScaffoldMessenger.of(ref.context).showSnackBar(
        SnackBar(
          content: Text(S
              .of(ref.context)
              .fileGetfilenamefilekeyIsNotAvailableOffline(
                  getFileName(fileKey))),
        ),
      );
    }
  });
}

void shareItem(String fileKey, WidgetRef ref) {
  // show dialog with slider with intervals from 15m to 144h
  showDialog(
    context: ref.context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        title: Text(S.of(context).shareFile),
        content: Wrap(
          children: [
            Column(
              children: [
                const Text(
                    'How long should the file be available for sharing?'),
                const SizedBox(height: 8.0),
                Slider(
                  value: ref.watch(shareDurationProvider).toDouble(),
                  min: 15,
                  max: 8640,
                  divisions: 11,
                  label: formatMinutes(ref.watch(shareDurationProvider)),
                  onChanged: (value) {
                    setState(() {
                      ref.read(shareDurationProvider.notifier).state =
                          value.toInt();
                    });
                  },
                ),
              ],
            ),
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
              // Handle share action here
              logger.i('Sharing $fileKey');
              Navigator.of(context).pop();

              getFileLink(pb.authStore.model.id, fileKey, pb.authStore.token,
                      sharing: true,
                      duration: formatMinutes(ref.watch(shareDurationProvider)))
                  .then((link) {
                Clipboard.setData(
                  ClipboardData(text: link),
                );

                ScaffoldMessenger.of(ref.context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).linkCopiedToClipboard),
                  ),
                );
              });
            },
            child: Text(S.of(context).share),
          ),
        ],
      );
    }),
  );
}

class FileItem extends ConsumerWidget {
  final String fileKey;
  final int expectedSize; // used for ensuring offline file is complete

  const FileItem({
    super.key,
    required this.fileKey,
    this.expectedSize = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FileType type = getFileType(fileKey);
    final isAvailableOffline = ref.watch(isFileOffline(fileKey));
    final downloadController = ref.watch(downloadControllerProvider);

    return Card(
      child: InkWell(
        child: ListTile(
          leading: Icon(
            type == FileType.image
                ? Icons.image
                : type == FileType.video
                    ? Icons.video_library
                    : Icons.insert_drive_file,
          ),
          title: isAvailableOffline.when(
            data: (offline) {
              if (offline) {
                return Text('${getFileName(fileKey)} ✓');
              } else {
                return Text(getFileName(fileKey));
              }
            },
            loading: () => Text(getFileName(fileKey)),
            error: (err, stack) {
              logger.e('Error checking if $fileKey is available offline: $err');
              return Text('${getFileName(fileKey)} (!)');
            },
          ),
          trailing: PopupMenuButton<String>(
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'open',
                child: Text(S.of(context).open),
              ),
              PopupMenuItem<String>(
                value: 'share',
                child: Text(S.of(context).share),
              ),
              PopupMenuItem<String>(
                value: 'save',
                child: Text(S.of(context).save),
              ),
              PopupMenuItem<String>(
                value: 'delete',
                child: Text(S.of(context).delete),
              ),
            ],
            onSelected: (value) {
              if (value == 'open') {
                openItem(fileKey, ref);
              } else if (value == 'save') {
                downloadItem(fileKey, downloadController, context);
              } else if (value == 'delete') {
                // ask for confirmation before deleting
                deleteItem(fileKey, context, ref);
              } else if (value == 'share') {
                shareItem(fileKey, ref);
              }
            },
          ),
        ),
        onTap: () => openItem(fileKey, ref),
      ),
    );
  }
}
