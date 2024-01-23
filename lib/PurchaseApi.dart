import 'package:blazedcloud/log.dart';
import 'package:blazedcloud/providers/glassfy_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:glassfy_flutter/models.dart';

class PurchaseApi {
  static void checkSubscription(WidgetRef ref) {
    PurchaseApi.fetchOffers().then((value) async {
      try {
        var permission = await Glassfy.permissions();
        permission.all?.forEach((p) => {
              logger.i("Permission: ${p.toJson()}"),
              if (p.permissionId == "terabyte" && p.isValid == true)
                {
                  ref.read(premiumProvider.notifier).state = true,
                }
            });
      } catch (e) {
        logger.w("Glassfy failed to fetch permissions: $e");
      }
    });
  }

  static Future<List<GlassfyOffering>> fetchOffers() async {
    try {
      final offerings = await Glassfy.offerings();
      return offerings.all ?? [];
    } catch (e) {
      logger.w("Glassfy failed to fetch offers: $e");
      return [];
    }
  }
}
