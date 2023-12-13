import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchItem extends ConsumerWidget {
  final String fileKey;

  const SearchItem({
    super.key,
    required this.fileKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FileType type = getFileType(fileKey);

    return InkWell(
      child: Card(
        child: ListTile(
          leading: Icon(
            type == FileType.image
                ? Icons.image
                : type == FileType.video
                    ? Icons.video_library
                    : Icons.insert_drive_file,
          ),
          title: Text(getFileName(fileKey)),
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(fileKey);

        logger.i('Going to $fileKey');

        // change current directory to the directory of the file
        ref.read(currentDirectoryProvider.notifier).state =
            getFileDirectory(fileKey);
      },
    );
  }
}
