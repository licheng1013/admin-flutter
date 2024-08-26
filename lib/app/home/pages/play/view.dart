import 'package:admin_flutter/app/home/head/logic.dart';
import 'package:admin_flutter/app/home/pages/chat/view.dart';
import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/component/video/view.dart';
import 'package:admin_flutter/ex/ex_btn.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PlayPage extends StatelessWidget {
  PlayPage({Key? key}) : super(key: key);
  final logic = Get.put(PlayLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 52,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: logic.inputController,
                ),
              ),
              "加载".toBtn(onTap: () {
                logic.isLoad.value = !logic.isLoad.value;
              }),
            ],
          ),
        ),
        Expanded(child: Obx(() {
          return logic.isLoad.value
              ? VideoPage(logic.inputController.text)
              : const Center(
                  child: Text(
                    "请加载视频！",
                    style: TextStyle(fontSize: 28),
                  ),
                );
        })),
      ],
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(name: "播放功能", icon: Icons.play_circle, page: PlayPage());
  }
}
