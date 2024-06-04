import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/generated/l10n.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/providers/files_providers.dart';
import 'package:blazedcloud/providers/glassfy_providers.dart';
import 'package:blazedcloud/providers/pb_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:intl/intl.dart';

final isLoadingPurchaseProvider = StateProvider<bool>((ref) => false);

class GlassfyPaywallPage extends ConsumerWidget {
  const GlassfyPaywallPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).upgradeStorage),
        ),
        body: ref.watch(premiumOfferingsProvider).when(data: (offerings) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: offerings?.all?.length ?? 0,
              itemBuilder: (context, index) {
                final offering = offerings?.all?[index];
                if (offering == null) {
                  return const SizedBox();
                }
                final product = offering.skus?.first.product;
                final price = product?.price;
                final description = product?.description;
                String title = product?.title ?? ''; // remove parathesis
                title = title.replaceAll(RegExp(r'\(.*\)'), '');
                return Card(
                  child: ListTile(
                    title: Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text(description ?? 'Description'),
                    trailing: Text(
                        NumberFormat.simpleCurrency().format(price ?? 0.0)),
                    leading: const Icon(CupertinoIcons.cube_box),
                    onTap: () async {
                      try {
                        logger.d(offering.toJson());
                        if (ref.read(isLoadingPurchaseProvider)) {
                          return;
                        }
                        ref.read(isLoadingPurchaseProvider.notifier).state =
                            true;

                        final transaction =
                            await Glassfy.purchaseSku(offering.skus!.first);

                        final p = transaction.permissions?.all?.singleWhere(
                            (permission) => permission.isValid == true);
                        if (p != null) {
                          ref.read(premiumProvider.notifier).state = true;
                          ref.invalidate(
                              accountUserProvider(pb.authStore.model.id));
                          ref.invalidate(
                              combinedDataProvider(pb.authStore.model.id));
                        } else {
                          ref.read(isLoadingPurchaseProvider.notifier).state =
                              false;
                        }
                      } catch (e) {
                        logger.w("Glassfy failed to purchase: $e");
                        ref.read(isLoadingPurchaseProvider.notifier).state =
                            false;
                      }
                    },
                  ),
                );
              });
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }, error: (error, stack) {
          return Center(
            child: Text('Error: $error'),
          );
        }));
  }
}
