import 'package:blazedcloud/constants.dart';
import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/providers/glassfy_providers.dart';
import 'package:blazedcloud/providers/pb_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:glassfy_flutter/models.dart';

class PurchaseApi {
  static void checkSubscription(WidgetRef ref) {
    ref.read(accountUserProvider(pb.authStore.model.id)).whenData((user) {
      if (user.active_tier.isNotEmpty) {
        ref.read(premiumProvider.notifier).state = true;
      }
    });
  }

  static Future<List<GlassfyOffering>> fetchOffers() async {
    await Glassfy.connectCustomSubscriber(pb.authStore.model.id);
    try {
      final offerings = await Glassfy.offerings();
      return offerings.all ?? [];
    } catch (e) {
      logger.w("Glassfy failed to fetch offers: $e");
      return [];
    }
  }
}
