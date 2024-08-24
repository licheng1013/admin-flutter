import 'package:admin_flutter/app/home/pages/chat/chat_info.dart';
import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/ex/ex_btn.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  final logic = Get.put(ChatLogic());

  @override
  Widget build(BuildContext context) {
    logic.jumpToBottom(enableAnim: false);
    return Column(
      children: [
        Expanded(
          child: Obx(() {
            return ListView.builder(
              controller: logic.scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: logic.chatList.length,
              cacheExtent: 100, // Cache items up to 1000 pixels off-screen
              itemBuilder: (BuildContext context, int index) {
                return info(index);
              },
            );
          }),
        ),
        ThemeUtil.lineH(),
        input()
      ],
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(name: "聊天页面", icon: Icons.chat, page: ChatPage());
  }

  Widget info(int index) {
    var msg = logic.chatList[index];
    var isMe = msg.userId == logic.meUserId;
    var show = true;
    if (index != 0) {
      var last = logic.chatList[index - 1];
      show = last.userId != msg.userId;
    }
    if (isMe) {
      return Row(
        children: [
          const Spacer(),
          infoText(isMe, msg),
          w,
          head(show),
        ],
      );
    }
    return Row(
      children: [
        head(show),
        w,
        infoText(isMe, msg),
        const Spacer(),
      ],
    );
  }

  static var w = const SizedBox(
    width: 4,
  );

  Widget infoText(bool isMe, ChatInfo info) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isMe ? UiTheme.primary2() : UiTheme.onBackground2(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SelectionArea(
        child: Text(
          info.msg,
        ),
      ),
    );
  }

  Widget head(bool show) {
    var size = 42.0;
    if (show) {
      return ClipOval(
          child: Image.asset(
        "assets/images/cat.jpeg",
        height: size,
        width: size,
      ));
    }
    return SizedBox(
      width: size,
      height: size,
    );
  }

  Widget input() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: UiTheme.onBackground2(),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: logic.focusNode,
              onSubmitted: (value) {
                logic.sendMsg();
              },
              controller: logic.msgController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入...',
              ),
            ),
          ),
          ThemeUtil.width(),
          "发送".toBtn(onTap: logic.sendMsg),
        ],
      ),
    );
  }
}
