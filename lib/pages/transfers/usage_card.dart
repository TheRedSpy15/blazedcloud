import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loadingPurchaseProvider = StateProvider<bool>((ref) => false);

class UsageCard extends ConsumerWidget {
  const UsageCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usageData = ref.watch(combinedDataProvider(pb.authStore.model.id));

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Storage Usage',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            usageData.when(
              data: (data) {
                final usageGB = (data['usage'] / 1000000000);
                logger.i('Usage: $usageGB GB / ${data['capacity']} GB');

                // Calculate the percentage of usage
                num percentage = (usageGB / data['capacity']) * 100.0;
                if (percentage.isNaN || percentage.isInfinite) {
                  percentage = 1;
                }

                // Determine the theme brightness
                Brightness themeBrightness = Theme.of(context).brightness;

                // Define the colors based on usage and theme brightness
                Color progressBarColor =
                    percentage > 100 ? Colors.red : Colors.blue;
                Color textColor = percentage > 100
                    ? Colors.red
                    : themeBrightness == Brightness.dark
                        ? Colors.white
                        : Colors.black;

                return Column(
                  children: [
                    LinearProgressIndicator(
                      value: percentage / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(progressBarColor),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Usage: ${usageGB.toStringAsFixed(2)} GB / ${data['capacity']} GB',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: textColor,
                      ),
                    ),
                    if (!data['isTerabyteActive'])
                      const Text(
                        'Purchase 1TB using Playstore build. You can uninstall that version when done.',
                        textAlign: TextAlign.center,
                      ),
                  ],
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (error, stack) => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
