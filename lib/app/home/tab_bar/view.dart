import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TabBarPage extends StatelessWidget {
  TabBarPage({Key? key}) : super(key: key);

  final logic = Get.put(TabBarLogic());
  final state = Get.find<TabBarLogic>().state;

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
            // 允许滚动
            padding: EdgeInsets.zero,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            //移除间距
            labelPadding: EdgeInsets.zero,
            tabs: [
              for (int i = 0; i < logic.tabList.length; i++)
                GestureDetector(
                  onSecondaryTapDown: (TapDownDetails details) {
                    logic.contextMenu(i, details);
                  },
                  child: Container(
                    height: logic.height,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(child: Text(logic.tabList[i].name)),
                  ),
                )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: logic.tabController,
              children: [
                for (int i = 0; i < logic.tabList.length; i++)
                  logic.tabList[i].page,
              ],
            ),
          ),
        ],
      );
    });
  }
}
