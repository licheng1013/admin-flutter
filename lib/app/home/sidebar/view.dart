import 'package:app_template/app/home/tab_bar/logic.dart';
import 'package:app_template/ex/ex_anim.dart';
import 'package:app_template/ex/ex_string.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SidebarPage extends StatelessWidget {
  SidebarPage({Key? key}) : super(key: key);

  final logic = Get.put(SidebarLogic());
  static var changeStyle = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return changeStyle.value ? _default() : _styleWithTab();
    });
  }

  Widget _default() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        var item = SidebarLogic.treeList[index];
        return item.children.isNotEmpty ? _tree(item) : _text(item);
      },
      itemCount: SidebarLogic.treeList.length,
    );
  }

  Widget _styleWithTab() {
    // 构建一个新的标签树
    var list = <SidebarTree>[];
    for (var item in SidebarLogic.treeList) {
      list.add(item);
      list.addAll(item.children);
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        var item = list[index];
        if (item.children.isNotEmpty) {
          return Center(
              child: Text(item.name,
                  style: TextStyle(color: UiTheme.onBackground())));
        }
        return _text(item);
      },
      itemCount: list.length,
    );
  }

  Widget _text(SidebarTree item,{double left = 12}) {
    return MouseRegion(
      // 鼠标悬停
      onEnter: (event) {
        logic.animName.value = item.name;
      },
      onExit: (event) {
        logic.animName.value = "";
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (item.children.isNotEmpty) {
              if (logic.expansionTile.contains(item.name)) {
                logic.expansionTile.remove(item.name);
              } else {
                logic.expansionTile.add(item.name);
              }
              return;
            }
            SidebarLogic.selectName.value = item.name;
            SidebarLogic.selectPage = item.page;
            TabBarLogic.addPage(item);
          },
          child: Obx(() {
            var selected = SidebarLogic.selectName.value == item.name;
            return Container(
                width: double.infinity,
                decoration: ThemeUtil.boxDecoration(
                    color: selected ? UiTheme.primary() : null, radius: 12),
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: left),
                    Icon(
                      item.icon,
                      color: UiTheme.getTextColor(selected),
                    ).toJump(logic.animName.value == item.name),
                    ThemeUtil.rowWidth(),
                    Text(
                      item.name,
                    ),
                    const Spacer(),
                    // 下拉箭头
                    Visibility(
                      visible: item.children.isNotEmpty,
                      child: Icon(
                        logic.expansionTile.contains(item.name)
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: UiTheme.getTextColor(selected),
                        size: 28,
                      ),
                    ),
                    ThemeUtil.rowWidth(),
                  ],
                ));
          }),
        ),
      ),
    );
  }

  Widget _tree(SidebarTree item) {
    return Column(
      children: [
        _text(item),
        Obx(() {
          return Visibility(
              visible: logic.expansionTile.contains(item.name),
              child: Column(
                children: item.children.map((e) => _text(e,left: 24)).toList(),
              ));
        })
      ],
    );
  }
}
