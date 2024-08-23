import 'package:admin_flutter/app/home/tab_bar/logic.dart';
import 'package:admin_flutter/ex/ex_anim.dart';
import 'package:admin_flutter/ex/ex_list.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SidebarPage extends StatelessWidget {
  SidebarPage({Key? key}) : super(key: key);

  final logic = Get.put(SidebarLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _default()) ;
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
              logic.expansionTile.addOrRemove(item.name);
              SidebarLogic.selSidebarTree(item);
              return;
            }
            SidebarLogic.selectPage = item.page;
            SidebarLogic.selectName.value = item.name;
            SidebarLogic.selSidebarTree(item);
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
                      color: UiTheme.getOnPrimary(selected),
                    ).toJump(logic.animName.value == item.name),
                    ThemeUtil.width(),
                    Text(
                      item.name,
                      style: TextStyle(color: UiTheme.getOnPrimary(selected)),
                    ),
                    const Spacer(),
                    // 下拉箭头
                    Visibility(
                      visible: item.children.isNotEmpty,
                      child: Icon(
                         Icons.arrow_drop_up,
                        color: UiTheme.getTextColor(selected),
                        size: 28,
                      ).toRotate(logic.expansionTile.contains(item.name)),
                    ),
                    ThemeUtil.width(),
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
              )
          );
        })
      ],
    );
  }
}
