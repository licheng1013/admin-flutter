import 'package:bot_toast/bot_toast.dart';

class MessageUtil {
  static void show(String msg) {
    BotToast.showText(text: msg); //弹出一个文本框;
  }
}
