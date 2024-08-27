import 'package:admin_flutter/app/home/pages/chat/chat_info.dart';
import 'package:admin_flutter/ex/ex_int.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class ChatLogic extends GetxController {
  var meUserId = 1;
  var otherUserId = 2;
  var chatList = <ChatInfo>[].obs;
  // 焦点
  var focusNode = FocusNode();
  var msgController = TextEditingController();
  var scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    for (var i = 0; i < 30; i++) {
      var chatInfo = ChatInfo();
      chatInfo.userId = i % 2 == 0 ? meUserId : otherUserId;
      chatInfo.msg = "你好呀，小明。$i";
      chatList.add(chatInfo);
    }
  }


  void sendMsg() {
    var msg = msgController.text;
    if (msg.isEmpty) {
      return;
    }
    var chatInfo = ChatInfo();
    chatInfo.userId = meUserId;
    chatInfo.msg = msg;
    chatList.add(chatInfo);
    msgController.text = "";
    focusNode.requestFocus();
    jumpToBottom();
  }

  void jumpToBottom({bool enableAnim = true}) {
    128.toDelay(() {
      var offset = scrollController.position.maxScrollExtent;
      if(enableAnim){
        scrollController.animateTo(offset, duration: 300.ms, curve: Curves.ease);
      }else{
        scrollController.jumpTo(offset);
      }
    });
  }
}
