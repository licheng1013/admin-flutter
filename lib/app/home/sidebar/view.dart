import 'package:app_template/app/home/tab_bar/logic.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SidebarPage extends StatelessWidget {
  SidebarPage({Key? key}) : super(key: key);

  final logic = Get.put(SidebarLogic());
  final state = Get.find<SidebarLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              for (var item in SidebarLogic.treeList)
                item.children.isNotEmpty ? _tree(item) : _text(item)
            ],
          ),
        ),
      ],
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
          return Container(
              width: double.infinity,
              decoration: ThemeUtil.boxDecoration(
                  color: SidebarLogic.selectName.value == item.name
                      ? UiTheme.primary()
                      : null,
                  radius: 12),
              height: 50,
              child: Center(
                  child: Text(
                item.name,
                style: TextStyle(color: UiTheme.getTextColor(SidebarLogic.selectName.value == item.name)),
              )));
        }),
      ),
    );
  }

  Widget _tree(SidebarTree item) {
    return ExpansionTile(
      title: Text(item.name, style: const TextStyle(fontSize: 16)),
      shape: const LinearBorder(),
      initiallyExpanded: logic.expansionTile.contains(item.name),
      onExpansionChanged: (value) {
        if (value) {
          logic.expansionTile.add(item.name);
        } else {
          logic.expansionTile.remove(item.name);
        }
      },
      leading: item.icon,
      children: [
        for (var child in item.children) _text(child),
      ],
    );
  }
}
