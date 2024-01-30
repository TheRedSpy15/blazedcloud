import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/controllers/download_controller.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/models/pocketbase/user.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:blazedcloud/providers/pb_providers.dart';
import 'package:blazedcloud/providers/transfers_providers.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;
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
          content:
              Text(S.of(ref.context).errorOpeningFileE(getFileName(fileKey))),
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

void openItem(
  String fileKey,
  WidgetRef ref,
) {
  isFileSavedOffline(fileKey).then((offlineFile) {
    if (offlineFile &&
        !isFileBeingDownloaded(fileKey, ref.read(downloadStateProvider))) {
      openFromOffline(fileKey, ref);
    } else if (getFileType(fileKey) == FileType.image) {
      getFileLink(pb.authStore.model.id, fileKey, pb.authStore.token,
              duration: "60m")
          .then((link) {
        final imageProvider = ExtendedNetworkImageProvider(link);
        showImageViewer(ref.context, imageProvider);
      });
    } else if (getFileType(fileKey) == FileType.video) {
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

void shareDialog(WidgetRef ref, String fileKey) {
  showDialog(
    context: ref.context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        title: Text(S.of(context).shareFile),
        content: Wrap(
          children: [
            Column(
              children: [
                Text(S.of(context).howLongToShare),
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

void shareEmailVerificationDialog(WidgetRef ref, User data) {
  showDialog(
    context: ref.context,
    builder: (context) => AlertDialog(
      title: Text(S.of(context).notVerified),
      content: Text(S.of(context).shareEmailVerificationNeeded),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            logger.i('Resending verification email');
            Navigator.of(context).pop();
            pb
                .collection('users')
                .requestVerification(data.email)
                .then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).emailSent)));
            }).onError((error, stackTrace) {
              logger.e("Error sending password reset email: $error");
              return null;
            });
          },
          child: Text(S.of(context).sendEmail),
        ),
      ],
    ),
  );
}

void shareItem(String fileKey, WidgetRef ref) {
  // get user information to check if verified
  final userData = ref.watch(accountUserProvider(pb.authStore.model.id));
  userData.when(
    data: (data) {
      if (data.verified || data.terabyte_active) {
        shareDialog(ref, fileKey);
      } else {
        shareEmailVerificationDialog(ref, data);
      }
    },
    loading: () => false,
    error: (err, stack) {
      logger.e('Error getting user data: $err');
      return false;
    },
  );
}

class FileItem extends ConsumerWidget {
  final String fileKey;
  final String uploaded;
  final int size;

  const FileItem({
    super.key,
    required this.fileKey,
    required this.size,
    required this.uploaded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FileType type = getFileType(fileKey);
    final isAvailableOffline = ref.watch(isFileOffline(fileKey));
    final downloadController = ref.watch(downloadControllerProvider);

    // convert upload string from '2021-01-01T00:00:00.000Z' to local format with just date
    final date = intl.DateFormat.yMd().format(DateTime.parse(uploaded));
    final String subtitle = '${formatSize(size)} • $date';

    return InkWell(
      child: ListTile(
        leading: type == FileType.image
            ? FutureBuilder(
                future: getFileLink(
                    pb.authStore.model.id, fileKey, pb.authStore.token,
                    duration: "60m"),
                builder: (context, snapshot) {
                  return ExtendedImage.network(
                    snapshot.data.toString(),
                    timeRetry: const Duration(seconds: 1),
                    timeLimit: const Duration(seconds: 5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                    compressionRatio: 0.1,
                    cache: true,
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  );
                })
            : type == FileType.video
                ? const Icon(Icons.video_library)
                : const Icon(Icons.insert_drive_file),
        title: isAvailableOffline.when(
          data: (offline) {
            return offline
                ? Text('${getFileName(fileKey)} ✓')
                : Text(getFileName(fileKey));
          },
          loading: () => Text(getFileName(fileKey)),
          error: (err, stack) {
            logger.e('Error checking if $fileKey is available offline: $err');
            return Text('${getFileName(fileKey)} (!)');
          },
        ),
        subtitle: Text(subtitle),
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
    );
  }
}
