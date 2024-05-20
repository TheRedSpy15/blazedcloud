import 'package:blazedcloud/PurchaseApi.dart';
import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:blazedcloud/providers/glassfy_providers.dart';
import 'package:blazedcloud/providers/pb_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final loadingPurchaseProvider = StateProvider<bool>((ref) => false);

class UsageCard extends ConsumerWidget {
  const UsageCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usageData = ref.watch(combinedDataProvider(pb.authStore.model.id));

    PurchaseApi.checkSubscription(ref);

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
                    if (!data['isTerabyteActive'])
                      ref.watch(premiumOfferingsProvider).when(
                          data: (offerings) {
                            return OutlinedButton(
                                onPressed: () async {
                                  try {
                                    if (ref.read(loadingPurchaseProvider)) {
                                      return;
                                    }

                                    Glassfy.connectCustomSubscriber(
                                        pb.authStore.model.id);
                                    final transaction =
                                        await Glassfy.purchaseSku(
                                            offerings!.all!.first.skus!.first);
                                    var p = transaction.permissions?.all
                                        ?.singleWhere((permission) =>
                                            permission.permissionId ==
                                            'terabyte');
                                    if (p?.isValid == true) {
                                      ref.read(premiumProvider.notifier).state =
                                          true;
                                      ref
                                          .read(accountUserProvider(
                                              pb.authStore.model.id))
                                          .whenData((user) {
                                        // subscription is active
                                        user.terabyte_active = true;
                                        ref.invalidate(combinedDataProvider(
                                            pb.authStore.model.id));
                                      });
                                    } else {
                                      ref
                                          .read(
                                              loadingPurchaseProvider.notifier)
                                          .state = false;
                                    }
                                  } catch (e) {
                                    logger.w("Glassfy failed to purchase: $e");
                                    ref
                                        .read(loadingPurchaseProvider.notifier)
                                        .state = false;
                                  }
                                },
                                child: Text(
                                    S.of(context).upgradeStorage1Terabyte));
                          },
                          error: (e, s) {
                            logger.e(e);
                            return const SizedBox.shrink();
                          },
                          loading: () => const SizedBox.shrink())
                    else if (data['stripeActive'] && data['isTerabyteActive'])
                      OutlinedButton(
                          onPressed: () {
                            const link =
                                "https://portal.blazedcloud.com/dashboard/account";
                            canLaunchUrl(Uri.parse(link)).then((canLaunch) {
                              if (canLaunch) {
                                ScaffoldMessenger.of(ref.context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        S.of(ref.context).openingInBrowser),
                                  ),
                                );
                                launchUrl(Uri.parse(link));
                              } else {
                                logger.e('Could not launch url: $link');
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
                    else if (data['stripeActive'])
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
