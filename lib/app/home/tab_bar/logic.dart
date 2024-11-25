import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/app/home/system/analysis/view.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarLogic extends GetxController with GetTickerProviderStateMixin {
  var tabList = <SidebarTree>[].obs;

  /// 当前右键的索引位置
  var index = (-1).obs;
  var height = 36.0;

  /// 标签索引位子
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
        logic.currentIndex.value = logic.tabList.indexOf(item);
        return;
      }
    }
    logic.addTab(page);
  }

  void addTab(SidebarTree page) {
    tabList.add(page);
    currentIndex.value = tabList.length - 1;
  }

  void contextMenu(int i, TapDownDetails details) {
    // 获取点击的位置
    var dx = details.globalPosition.dx;
    var dy = details.globalPosition.dy;
    // -去相对组件的位置这样得到了组件的垂直中心点
    dy = dy - details.localPosition.dy + height / 2;
    //MessageUtil.show("右键: $i: $dx $dy");
    var menuList = CloseMenu.values.toList();
    if (i == tabList.length - 1) {
      menuList.remove(CloseMenu.closeRight);
      menuList.remove(CloseMenu.closeOther);
    }
    if (i == 0) {
      menuList.remove(CloseMenu.closeLeft);
      menuList.remove(CloseMenu.closeOther);
    }

    if (tabList.length == 1) {
      menuList = [CloseMenu.close];
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
                  height: menuList.length * 34.0,
                  decoration: UiTheme.decoration(radius: 0),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var item in menuList)
                          InkWell(
                            onTap: () {
                              onCloseTab(item, i);
                            },
                            child: Container(
                              height: 32,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  item.icon,
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(item.desc),
                                ],
                              ),
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

  void onCloseTab(CloseMenu item, int i) {
    // 如果是默认的一个tab不允许关闭
    switch (item) {
      case CloseMenu.close:
        tabList.removeAt(i);
        if (i == currentIndex.value) {
          currentIndex.value =  i > 0 ? i - 1 : 0;
        } else if (i < currentIndex.value) {
          currentIndex.value--;
        }
        SidebarLogic.selectName.value =
        tabList.isEmpty ? "" : tabList.last.name;
        break;
      case CloseMenu.closeAll:
        tabList.value = [];
        SidebarLogic.selectName.value = "";
        break;
      case CloseMenu.closeOther:
        var temp = tabList[i];
        tabList.value = [temp];
        SidebarLogic.selectName.value = tabList.last.name;
        currentIndex.value = 0;
        break;
      case CloseMenu.closeRight:
        tabList.removeRange(i + 1, tabList.length);
        SidebarLogic.selectName.value = tabList.last.name;
        break;
      case CloseMenu.closeLeft:
        tabList.removeRange(0, i);
        currentIndex.value = 0;
        SidebarLogic.selectName.value = tabList.last.name;
        break;
    }
    Get.back();
  }
}

// 关闭菜单枚举
enum CloseMenu {
  close(Icon(Icons.close), "关闭当前"), //关闭当前
  closeAll(Icon(Icons.clear_all_sharp), "关闭所有"), //关闭所有
  closeOther(Icon(Icons.delete_outline), "关闭其他"), //关闭其他
  closeRight(Icon(Icons.chevron_right), "关闭右侧"), //关闭右侧
  closeLeft(Icon(Icons.chevron_left), "关闭左侧"), //关闭左侧
  ;

  final Widget icon;
  final String desc;

  const CloseMenu(this.icon, this.desc);
}
