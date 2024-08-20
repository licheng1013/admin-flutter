import 'package:app_template/app/home/sidebar/view.dart';
import 'package:app_template/ex/ex_anim.dart';
import 'package:app_template/ex/ex_list.dart';
import 'package:app_template/theme/ui_theme.dart';
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
        return SizedBox(
          height: logic.height,
          child: const Center(
            child: Text("导航栏..."),
          ),
        );
      }

      return Column(
        children: [
          TabBar(
            controller: logic.tabController,
            onTap: (e) => logic.currentIndex.value = e,
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
                  e.page.toFadeIn(logic.currentIndex.value == index)),
            ),
          ),
        ],
      );
    });
  }
}
