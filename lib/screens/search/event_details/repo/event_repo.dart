

import 'package:url_launcher/url_launcher.dart';

class EventRepo{
  Future<void> launchUrlStart({required String url}) async {
    if (url.length == 0) return;
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.inAppBrowserView)) {
      throw 'Could not launch $url';
    }
  }
}