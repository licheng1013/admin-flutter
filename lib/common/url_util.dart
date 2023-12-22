// 对于 url_launcher 库的简单封装

import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  static void openUrl(String url) {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
