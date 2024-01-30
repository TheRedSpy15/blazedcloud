import 'package:blazedcloud/models/pocketbase/authstore.dart';
import 'package:pocketbase/pocketbase.dart';

// prod
const String backendUrl = "https://pb.blazedcloud.com";
// lan
//const String backendUrl = "http://192.168.68.89:8089";
// devs
//const String backendUrl = "https://hazmav.tplinkdns.com:8089";
const filePageIndex = 0;
const settingsPageIndex = 3;
const syncPageIndex = 2;
const transferPageIndex = 1;
var pb = PocketBase(backendUrl, authStore: CustomAuthStore());
