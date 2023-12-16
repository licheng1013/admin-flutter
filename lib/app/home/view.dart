import 'package:app_template/app/home/head/view.dart';
import 'package:app_template/app/home/pages/analysis/view.dart';
import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:app_template/app/home/sidebar/view.dart';
import 'package:app_template/common/animate_util.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadPage(),
          Expanded(
            child: Row(
              children: [
                // 宽度扩大动画
                Obx(() {
                  return AnimateUtil.widthScaleAnimation(
                      SidebarPage(), 250, SidebarLogic.isExpanded.value);
                }),
                ThemeUtil.lineV(),
                Expanded(child: Obx(() {
                  return Visibility(
                    visible: SidebarLogic.selectName.value != "",
                    child: IndexedStack(
                      index: SidebarLogic.treeList.indexWhere((element) =>
                          element.name == SidebarLogic.selectName.value),
                      children: [
                        for (var item in SidebarLogic.treeList) item.page
                      ],
                    ),
                  );
                }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
