import 'package:admin_flutter/app/home/head/view.dart';
import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/app/home/sidebar/view.dart';
import 'package:admin_flutter/app/home/tab_bar/view.dart';
import 'package:admin_flutter/common/animate_util.dart';
import 'package:admin_flutter/component/watermark.dart';
import 'package:admin_flutter/main.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  static Widget sidebarPage = SidebarPage();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (appReload.value) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator(),),);
      }
      return Stack(
        children: [
          body(),
          Positioned.fill(
            child: IgnorePointer(
              child: Obx(() {
                return Visibility(
                  visible: waterMark.value,
                  child: CustomPaint(
                    painter: WatermarkPainter(),
                  ),
                );
              }),
            ),
          ),
        ],
      );
    });
  }

  Widget body() {
    return Scaffold(
      body: Row(
        children: [
          // 宽度扩大动画
          Obx(() {
            return AnimateUtil.widthScaleAnimation(
                Visibility(
                  visible: SidebarLogic.isExpandedAnim.value,
                  child: sidebarPage,
                ),
                230,
                SidebarLogic.isExpanded.value, onEnd: () {
              if (SidebarLogic.isExpanded.value) {
                SidebarLogic.isExpandedAnim.value = true;
              }
            });
          }),
          ThemeUtil.lineV(),
          Expanded(
            child: Column(
              children: [
                HeadPage(),
                Expanded(child: TabBarPage()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
