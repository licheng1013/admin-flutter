import 'package:url_launcher/url_launcher.dart';

/// 对于 url_launcher 库的简单封装
extension ExUrl on String {
  /// 打开连接，以下方法需要第三方库支持
  void toOpenUrl() {
    launchUrl(Uri.parse(this), mode: LaunchMode.externalApplication);
  }
  /// 判断是不是一个有效的url
  bool toIsUrl() {
    return Uri.parse(this).isAbsolute;
  }
}