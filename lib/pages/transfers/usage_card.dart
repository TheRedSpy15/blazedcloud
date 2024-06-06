import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:blazedcloud/services/files_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class RefChromeSafariBrowser extends ChromeSafariBrowser {
  final WidgetRef ref;

  RefChromeSafariBrowser({required this.ref});

  @override
  void onClosed() {
    logger.d("ChromeSafari browser closed");
    ref.invalidate(combinedDataProvider(pb.authStore.model.id));
  }
}

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
            Text(
              S.of(context).storageUsage,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                    percentage > 100 ? Colors.red : Colors.purple;
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
                    if (!data['premium'] && isMobile)
                      OutlinedButton(
                          onPressed: () {
                            // snackbar to show loading
                            ScaffoldMessenger.of(ref.context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(S.of(ref.context).openingInBrowser),
                              ),
                            );

                            getStripeCheckout(pb.authStore.model.id,
                                    stripe1tbPriceId, pb.authStore.token)
                                .then((url) {
                              logger.d('Opening stripe checkout $url');
                              final browser = RefChromeSafariBrowser(ref: ref);
                              browser.open(url: WebUri(url)).then((value) {
                                logger.d('Invalidating combinedDataProvider');
                                ref.invalidate(combinedDataProvider(
                                    pb.authStore.model.id));
                              }).catchError((e) {
                                ScaffoldMessenger.of(ref.context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text(S.of(context).failedToOpenPortal),
                                  ),
                                );
                              });
                            }).catchError((e) {
                              logger.e(e);
                            });
                          },
                          child: Text(S.of(context).upgradeStorage))
                    else if (data['stripeActive'] && isMobile)
                      OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(ref.context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(S.of(ref.context).openingInBrowser),
                              ),
                            );
                            launchUrl(Uri.parse(stripePortalUrl));
                          },
                          child: Text(S.of(context).manageAccount))
                    else if (!data['stripeActive'] && data['premium'])
                      Text(S.of(context).subscribedThroughPlaystoreOrAppstore),
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
