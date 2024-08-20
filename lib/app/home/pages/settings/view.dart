import 'package:app_template/app/home/head/view.dart';
import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:app_template/common/app_data.dart';
import 'package:app_template/component/form/view.dart';
import 'package:app_template/ex/ex_btn.dart';
import 'package:app_template/ex/ex_list.dart';
import 'package:app_template/ex/ex_map.dart';
import 'package:app_template/main.dart';
import 'package:app_template/theme/my_theme.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final logic = Get.put(SettingsLogic());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          panel("主题设置", Row(
            children: themeList.toWidgets((item) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: item.name().toBtn(
                  onTap: () {
                    Get.changeThemeMode(ThemeMode.light);
                    Get.changeTheme(item.theme());
                    AppData.easySave((dg){
                      dg.themeName = item.name();
                    });
                  },
                  color: item.primary(),
                  textColor: item.onPrimary(),
                ),
              );
            }),
          )),
          panel("语言设置", Row(
            children: [
              Row(
                children: Get.translations.toWidgets((item) {
                  var langKey = item.toString();
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child:  langKey.toBtn(
                      onTap: () {
                        var locale = Locale(langKey);
                        Get.updateLocale(locale);
                      },
                    ),
                  );
                }),
              ),
              Text("settings".tr)
            ],
          ))
        ],
      ),
    );
  }

  Widget panel(String title, Widget widget) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: UiTheme.onPrimary(),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: SizedBox(
                height: 42,
                child:
                    Align(alignment: Alignment.centerLeft, child: Text(title,style: const TextStyle(fontSize: 18),))),
          ),
          ThemeUtil.lineH(),
          SizedBox(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: widget,
            ),
          )
        ],
      ),
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(
        name: "系统设置", icon: Icons.settings, page: SettingsPage());
  }
}
