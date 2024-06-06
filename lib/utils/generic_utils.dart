import 'dart:io';

import 'package:blazedcloud/log.dart';
import 'package:url_launcher/url_launcher.dart';

void viewToS() {
  logger.d("Terms of Service");
  final url = Platform.isIOS
      ? Uri.parse('itms-apps://itunes.apple.com/app/id6449180534')
      : Uri.parse('https://blazedcloud.com/terms-of-service/');
  canLaunchUrl(url).then((canLaunch) {
    if (canLaunch) {
      launchUrl(url);
    } else {
      logger.e("Can't launch url: $url");
    }
  });
}
