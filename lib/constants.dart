import 'package:blazedcloud/models/pocketbase/authstore.dart';
import 'package:pocketbase/pocketbase.dart';

const String backendUrl = "https://pb.blazedcloud.com";
const filePageIndex = 0;
const settingsPageIndex = 3;
const stripe100gbPriceId = 'price_1PF12LEnqBPpR1rOGlwYE0Xi';
const stripe1tbPriceId = 'price_1OVjb8EnqBPpR1rOYF2TdM3f';
const stripePortalUrl = 'https://billing.stripe.com/p/login/fZeaI4a7Teoycuc5kk';
const syncPageIndex = 2;
const transferPageIndex = 1;

var pb = PocketBase(backendUrl, authStore: CustomAuthStore());
