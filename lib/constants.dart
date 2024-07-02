import 'dart:io';

import 'package:blazedcloud/models/pocketbase/authstore.dart';
import 'package:pocketbase/pocketbase.dart';

const String backendUrl = "https://pb.blazedcloud.com";
const stripe1tbPriceId = 'price_1PT9opEnqBPpR1rOXXMAc5pY';
const stripePortalUrl = 'https://billing.stripe.com/p/login/fZeaI4a7Teoycuc5kk';

final isMobile = !Platform.isWindows && !Platform.isLinux && !Platform.isMacOS;
var pb = PocketBase(backendUrl, authStore: CustomAuthStore());
