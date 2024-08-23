import 'package:bot_toast/bot_toast.dart';

extension ExHint on String {
  /// 提示
  void toHint() {
    BotToast.showText(text: this); //弹出一个文本框;
  }

  /// 
}