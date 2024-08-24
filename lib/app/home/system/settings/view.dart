import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/common/app_data.dart';
import 'package:admin_flutter/ex/ex_btn.dart';
import 'package:admin_flutter/ex/ex_int.dart';
import 'package:admin_flutter/ex/ex_list.dart';
import 'package:admin_flutter/ex/ex_map.dart';
import 'package:admin_flutter/main.dart';
import 'package:admin_flutter/state.dart';
import 'package:admin_flutter/theme/my_theme.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
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
                      if(dg.themeName != item.name()){
                        appReload.value = true;
                        300.toDelay(() {
                          appReload.value = false;
                        });
                      }
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
          )),
          panel("水印设置", Row(
            children: [
              Row(
                children: [
                  "创建水印".toBtn(onTap: (){
                    waterMark.value = true;
                  }),
                  ThemeUtil.width(),
                  "移除水印".toOutlineBtn(onTap: (){
                    waterMark.value = false;
                  }),
                ],
              ),
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
          color: UiTheme.border(),
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
