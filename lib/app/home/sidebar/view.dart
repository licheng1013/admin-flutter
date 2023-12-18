import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SidebarPage extends StatelessWidget {
  SidebarPage({Key? key}) : super(key: key);

  final logic = Get.put(SidebarLogic());
  final state = Get.find<SidebarLogic>().state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var item in SidebarLogic.treeList)
          item.children.isNotEmpty ? _tree(item) : _text(item)
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
        },
        child: Obx(() {
          return Container(
              width: double.infinity,
              decoration: ThemeUtil.boxDecoration(
                  color: SidebarLogic.selectName.value == item.name
                      ? Colors.blue
                      : null,
                  radius: 12),
              height: 50,
              child: Center(child: Text(item.name, style:  TextStyle(color: SidebarLogic.selectName.value == item.name
                  ? Colors.white
                  : Colors.black
              ),)));
        }),
      ),
    );
  }

  Widget _tree(SidebarTree item) {
    return ExpansionTile(
      title: Text(item.name),
      shape: const LinearBorder(),
      leading: item.icon,
      children: [
        for (var child in item.children) _text(child),
      ],
    );
  }
}
