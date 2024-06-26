import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:app_template/common/assets_util.dart';
import 'package:app_template/common/message_util.dart';
import 'package:app_template/common/url_util.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HeadPage extends StatelessWidget {
  HeadPage({Key? key}) : super(key: key);

  final logic = Get.put(HeadLogic());
  final state = Get.find<HeadLogic>().state;

  @override
  Widget build(BuildContext context) {
    return _head();
  }

  Widget _head() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              ThemeUtil.rowWidth(),
              Obx(() {
                return IconButton(
                    onPressed: () {
                      SidebarLogic.isExpanded.value =
                          !SidebarLogic.isExpanded.value;
                      SidebarLogic.isExpandedAnim.value = false;
                    },
                    icon: SidebarLogic.isExpanded.value
                        ? const Icon(Icons.menu_open)
                        : const Icon(Icons.menu));
              }),
              const Spacer(),
              FilledButton(
                  onPressed: () {
                    UrlUtil.openUrl("https://flutterweb-wasm.web.app/");
                  },
                  child: const Text("Wasm")),
              ThemeUtil.rowWidth(),
              FilledButton(
                  onPressed: () {
                    UrlUtil.openUrl(
                        "https://github.com/licheng1013/admin-flutter");
                  },
                  child: const Text("Star")),
              ThemeUtil.rowWidth(),
              InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  logic.clickHeadImage();
                },
                child: const ClipOval(
                    // 圆形头像
                    child: FlutterLogo(
                  size: 36,
                )),
              ),
              ThemeUtil.rowWidth(),
            ],
          ),
        ),
        ThemeUtil.lineH(),
      ],
    );
  }
}
