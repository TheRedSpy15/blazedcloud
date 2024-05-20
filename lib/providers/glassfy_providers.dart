import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:glassfy_flutter/models.dart';

final premiumOfferingsProvider = FutureProvider<GlassfyOfferings?>((ref) async {
  return await Glassfy.offerings();
});

final premiumProvider = StateProvider<bool>((ref) => false);
