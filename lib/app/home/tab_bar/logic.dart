import 'package:app_template/app/home/pages/analysis/view.dart';
import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';


class TabBarLogic extends GetxController with GetTickerProviderStateMixin {
  final TabBarState state = TabBarState();
  TabController? tabController;
  var tabList = <SidebarTree>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabList.add(AnalysisPage.newThis());
    tabController = TabController(length: tabList.length, vsync: this);
  }

  static void addPage(SidebarTree page) {
    var logic = Get.find<TabBarLogic>();
    // 判断是否已经存在
    for (var item in logic.tabList) {
      if (item.name == page.name ) {
        logic.tabController?.animateTo(logic.tabList.indexOf(item));
        return;
      }
    }
    logic.addTab(page);
  }

  void addTab(SidebarTree page) {
      tabList.add(page);
      var lastIndex = tabController!.index;
      tabController?.dispose();
      tabController = TabController(length: tabList.length, vsync: this,initialIndex: lastIndex);
      tabController?.animateTo( tabList.length-1);
  }
}
