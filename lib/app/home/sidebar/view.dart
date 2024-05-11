import 'package:app_template/app/home/tab_bar/logic.dart';
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
  final state = Get.find<SidebarLogic>().state;
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
          return Center(child: Text(item.name, style: TextStyle(color: UiTheme.onBackground())));
        }
        return _text(item);
      },
      itemCount: list.length,
    );
  }

  Widget _text(SidebarTree item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          SidebarLogic.selectName.value = item.name;
          SidebarLogic.selectPage = item.page;
          TabBarLogic.addPage(item);
        },
        child: Obx(() {
          var selectd = SidebarLogic.selectName.value == item.name;
          return Container(
              width: double.infinity,
              decoration: ThemeUtil.boxDecoration(
                  color: selectd ? UiTheme.primary() : null,
                  radius: 12),
              height: 50,
              child: Row(
                children: [
                  const SizedBox(width: 28),
                  Icon(item.icon,color: UiTheme.getTextColor(selectd),),
                  ThemeUtil.rowWidth(),
                  Text(item.name,),
                ],
              ));
        }),
      ),
    );
  }

  Widget _tree(SidebarTree item) {
    return ExpansionTile(
      title: Text(item.name, style: const TextStyle(fontSize: 16)),
      shape: const LinearBorder(),
      initiallyExpanded: logic.expansionTile.contains(item.name),
      backgroundColor: UiTheme.onBackground2(),
      onExpansionChanged: (value) {
        if (value) {
          logic.expansionTile.add(item.name);
        } else {
          logic.expansionTile.remove(item.name);
        }
      },
      leading: Icon(item.icon),
      children: [
        for (var child in item.children) _text(child),
      ],
    );
  }
}
