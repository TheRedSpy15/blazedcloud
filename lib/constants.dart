import 'package:blazedcloud/models/pocketbase/authstore.dart';
import 'package:pocketbase/pocketbase.dart';

// localhost
//const String backendUrl = "http://10.0.2.2:8090";
// lan
//const String backendUrl = "http://192.168.68.50:8090";
// tests
//const String backendUrl = "http://127.0.0.1:8090";
// dev
//const String backendUrl = "https://mavhack.hopto.org";
// prod
const String backendUrl = "https://pb.blazedcloud.com";

var pb = PocketBase(backendUrl, authStore: CustomAuthStore());
