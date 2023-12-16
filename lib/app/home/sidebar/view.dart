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
        for (var item in SidebarLogic.treeList) _text(item),
      ],
    );
  }

  Widget _text(SidebarTree item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          SidebarLogic.selectName.value = item.name;
        },
        child: Obx(() {
          return Container(
              width: double.infinity,
              decoration: ThemeUtil.boxDecoration(
                  color: SidebarLogic.selectName.value == item.name
                      ? Colors.grey.shade200
                      : Colors.white,
                  radius: 12),
              height: 50,
              child: Center(child: Text(item.name)));
        }),
      ),
    );
  }
}
