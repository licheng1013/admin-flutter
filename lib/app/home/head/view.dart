import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:app_template/common/message_util.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'logic.dart';

class HeadPage extends StatelessWidget {
  HeadPage({Key? key}) : super(key: key);

  final logic = Get.put(HeadLogic());
  final state = Get.find<HeadLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              ThemeUtil.rowWidth(),
              IconButton(
                  onPressed: () {
                    SidebarLogic.isExpanded.value =
                        !SidebarLogic.isExpanded.value;
                    SidebarLogic.isExpandedAnim.value = false;
                  },
                  icon: const Icon(Icons.list)),
              const Spacer(),
              FilledButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://flutterweb-wasm.web.app/"),
                        mode: LaunchMode.externalApplication);
                  },
                  child: const Text("Flutter Wasm Demo")),
              ThemeUtil.rowWidth(),
              IconButton(
                  onPressed: () {
                    // 打开主页外部链接
                    launchUrl(
                        Uri.parse(
                            "https://github.com/licheng1013/admin-flutter"),
                        mode: LaunchMode.externalApplication);
                  },
                  icon: const Icon(Icons.home)),
              ThemeUtil.rowWidth(),
              IconButton(
                  onPressed: () {
                    MessageUtil.show("还在制作中...");
                  },
                  icon: const Icon(Icons.settings)),
              ThemeUtil.rowWidth(),
              FilledButton(
                  onPressed: () {
                    MessageUtil.show("还在制作中...");
                  },
                  child: const Text("帮助")),
              ThemeUtil.rowWidth(),
              FilledButton(
                  onPressed: () {
                    logic.logout();
                  },
                  child: const Text("退出登入")),
              ThemeUtil.rowWidth()
            ],
          ),
        ),
        ThemeUtil.lineH(),
      ],
    );
  }
}
