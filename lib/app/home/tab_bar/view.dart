import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/common/keep_alive_wrapper.dart';
import 'package:admin_flutter/ex/ex_anim.dart';
import 'package:admin_flutter/ex/ex_list.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TabBarPage extends StatelessWidget {
  TabBarPage({Key? key}) : super(key: key);

  final logic = Get.put(TabBarLogic());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (logic.tabList.isEmpty) {
        return const Center(
          child: Text(
            "未选中任何标签",
            style: TextStyle(fontSize: 24),
          ),
        );
      }
      return Column(
        children: [
          TabBar(
            controller: logic.tabController,
            onTap: (e) {
              var tab = logic.tabList[e];
              logic.currentIndex.value = e;
              SidebarLogic.selectName.value = tab.name;
              SidebarLogic.selSidebarTree(tab);
            },
            // 允许滚动
            padding: EdgeInsets.zero,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            //移除间距
            labelPadding: EdgeInsets.zero,
            tabs: logic.tabList.toWidgetsWithIndex((e, index) {
              return MouseRegion(
                onEnter: (event) {
                  logic.index.value = index;
                },
                onExit: (event) {
                  logic.index.value = -1;
                },
                child: GestureDetector(
                  onSecondaryTapDown: (TapDownDetails details) {
                    logic.contextMenu(index, details);
                  },
                  child: Container(
                    height: logic.height,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Obx(() {
                          return Icon(
                            e.icon,
                            size: 16,
                            color: UiTheme.getPrimary(
                                logic.currentIndex.value == index),
                          ).toJump(logic.index.value == index);
                        }),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(e.name),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          Expanded(
            child: IndexedStack(
              index: logic.currentIndex.value,
              children: logic.tabList.toWidgetsWithIndex((e, index) =>
                  KeepAliveWrapper(
                      child:
                          e.page.toFadeIn(logic.currentIndex.value == index))),
            ),
          ),
        ],
      );
    });
  }
}
