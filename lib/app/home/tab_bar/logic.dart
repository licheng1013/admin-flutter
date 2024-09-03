
import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/app/home/system/analysis/view.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TabBarLogic extends GetxController with GetTickerProviderStateMixin {
  TabController? tabController;
  var tabList = <SidebarTree>[].obs;
  var index = (-1).obs;
  var height = 36.0;
  var currentIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();

    var info = AnalysisPage.newThis();
    addTab(info);
    SidebarLogic.selectName.value = info.name;
    SidebarLogic.selSidebarTree(info);

  }

  static void addPage(SidebarTree page) {
    var logic = Get.find<TabBarLogic>();
    // 判断是否已经存在
    for (var item in logic.tabList) {
      if (item.name == page.name) {
        logic.tabController?.animateTo(logic.tabList.indexOf(item));
        logic.currentIndex.value = logic.tabList.indexOf(item);
        return;
      }
    }
    logic.addTab(page);
  }

  void addTab(SidebarTree page) {
    tabList.add(page);
    var lastIndex = tabController?.index;
    tabController?.dispose();
    tabController = TabController(
        length: tabList.length, vsync: this, initialIndex: lastIndex ?? 0);
    tabController?.animateTo(tabList.length - 1);
    currentIndex.value = tabList.length - 1;
  }


  void contextMenu(int i, TapDownDetails details) {
    // 获取点击的位置
    var dx = details.globalPosition.dx;
    var dy = details.globalPosition.dy;
    // -去相对组件的位置这样得到了组件的垂直中心点
    dy = dy - details.localPosition.dy + height / 2;
    //MessageUtil.show("右键: $i: $dx $dy");
    var closeMenuMap = contextMenuItem();
    if (i == tabList.length - 1) {
      closeMenuMap.remove(CloseMenu.closeRight);
      closeMenuMap.remove(CloseMenu.closeOther);
    }
    if (i == 0) {
      closeMenuMap.remove(CloseMenu.closeLeft);
      closeMenuMap.remove(CloseMenu.closeOther);
    }

    if (tabList.length == 1) {
      closeMenuMap.remove(CloseMenu.closeAll);
      closeMenuMap.remove(CloseMenu.closeOther);
      closeMenuMap.remove(CloseMenu.closeLeft);
      closeMenuMap.remove(CloseMenu.closeRight);
    }

    // 弹出上下文菜单
    showDialog(
        context: Get.context!,
        barrierColor: Colors.transparent,
        builder: (context) {
          return Stack(
            children: [
              Transform.translate(
                offset: Offset(dx, dy),
                child: Container(
                  width: 150,
                  height: closeMenuMap.length * 34.0,
                  decoration: UiTheme.decoration(radius: 0),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var item in closeMenuMap.keys)
                          InkWell(
                            onTap: () {
                              onCloseTab(item, i);
                            },
                            child: Container(
                              height: 32,
                              alignment: Alignment.center,
                              child: Text(closeMenuMap[item]!),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  static Map<CloseMenu, String> contextMenuItem() {
    var closeMenuMap = {
      CloseMenu.close: "关闭当前",
      CloseMenu.closeAll: "关闭所有",
      CloseMenu.closeOther: "关闭其他",
      CloseMenu.closeRight: "关闭右侧",
      CloseMenu.closeLeft: "关闭左侧",
    };
    return closeMenuMap;
  }

  void onCloseTab(CloseMenu item, int i) {
    // 如果是默认的一个tab不允许关闭
    switch (item) {
      case CloseMenu.close:
        tabController?.dispose();
        tabList.removeAt(i);
        if (tabList.isNotEmpty) {
          var index = i == 0 ? 0 : tabController!.index - 1;
          tabController = TabController(
              length: tabList.length, vsync: this, initialIndex: index);
          SidebarLogic.selectName.value = tabList[index].name;
          currentIndex.value = index;
        } else {
          tabController = null;
        }
        break;
      case CloseMenu.closeAll:
        tabList.clear();
        tabController?.dispose();
        tabController = null;
        SidebarLogic.selectName.value = "";
        break;
      case CloseMenu.closeOther:
        var temp = tabList[i];
        tabList.clear();
        tabList.add(temp);
        tabController?.dispose();
        tabController = TabController(length: tabList.length, vsync: this);
        break;
      case CloseMenu.closeRight:
        tabList.removeRange(i + 1, tabList.length);
        tabController?.dispose();
        tabController =
            TabController(length: tabList.length, vsync: this, initialIndex: i);
        break;
      case CloseMenu.closeLeft:
        tabList.removeRange(0, i);
        tabController?.dispose();
        tabController = TabController(length: tabList.length, vsync: this);
        break;
    }
    Get.back();
  }
}

// 关闭菜单枚举
enum CloseMenu {
  close, //关闭当前
  closeAll, //关闭所有
  closeOther, //关闭其他
  closeRight, //关闭右侧
  closeLeft, //关闭左侧
}
