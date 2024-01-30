import 'package:blazedcloud/utils/files_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransferCard extends StatelessWidget {
  final http.StreamedResponse transfer;
  final String fileKey;

  const TransferCard({
    super.key,
    required this.transfer,
    required this.fileKey,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = 0.0;
    Brightness themeBrightness = Theme.of(context).brightness;

    // Define the colors based on usage and theme brightness
    Color textColor =
        themeBrightness == Brightness.dark ? Colors.white : Colors.black;

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getFileName(fileKey),
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: textColor),
            ),
            const SizedBox(height: 8.0),
            LinearProgressIndicator(
              value: percentage > 1 ? percentage / 100.0 : null,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
