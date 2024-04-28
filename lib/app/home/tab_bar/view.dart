import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TabBarPage extends StatelessWidget {
  TabBarPage({Key? key}) : super(key: key);

  final logic = Get.put(TabBarLogic());
  final state = Get
      .find<TabBarLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    if (logic.tabController == null) {
      return const Center(
        child: Text("加载中..."),
      );
    }
    return Obx(() {
      return Column(
        children: [
          TabBar(
            controller: logic.tabController,
            // 允许滚动
            padding: EdgeInsets.zero,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            // 移除之前空格
            indicatorPadding: const EdgeInsets.all(0),
            tabs: [
              for (int i = 0; i < logic.tabList.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(logic.tabList[i].name),
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
