import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final logic = Get.put(SettingsLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var item in logic.themeList)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: FilledButton(
              child: Text(item.name()),
               onPressed: () {
                  Get.changeThemeMode(ThemeMode.light);
                  Get.changeTheme(item.theme());
               },
            ),
          ),
        const Text(
          "系统设置",
          style: TextStyle(fontSize: 28),
        ),
      ],
    );
  }

  static SidebarTree newThis(){
    return SidebarTree(
        name: "系统设置",
        icon: Icons.settings,
        page: SettingsPage()
    );
  }
}
