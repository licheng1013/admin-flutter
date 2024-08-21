import 'package:app_template/app/home/head/view.dart';
import 'package:app_template/app/home/pages/settings/view.dart';
import 'package:app_template/app/login/view.dart';
import 'package:app_template/common/app_data.dart';
import 'package:app_template/common/message_util.dart';
import 'package:app_template/common/url_util.dart';
import 'package:app_template/ex/ex_anim.dart';
import 'package:app_template/ex/ex_btn.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';


class HeadLogic extends GetxController {

  void logout() {
    AppData.easySave((p0) => {p0.token = "", Get.offAll(() => LoginPage())});
  }

  void clickHeadImage() {
    showDialog(
        context: Get.context!,
        barrierColor: Colors.transparent,
        builder: (context) {
          return Stack(
              children: [
                Positioned(
                  right: 10,
                  top: 55,
                  child: head(),
                ),
              ],
          );
        });
  }

  Widget head(){
    return Container(
      width: 200,
      decoration: UiTheme.decoration(),
      child: Column(
        children: [
          ThemeUtil.height(),
          "Github".toBtn(onTap: (){
            UrlUtil.openUrl(
                "https://github.com/licheng1013/admin-flutter");
          }),
          ThemeUtil.height(),
          "M3示例".toBtn(onTap: (){
            UrlUtil.openUrl("https://flutterweb-wasm.web.app/");
          }),
          ThemeUtil.height(),
          "帮助按钮".toBtn(onTap: (){
                MessageUtil.show("还在制作中...");
          }),
          ThemeUtil.height(),
          "退出登入".toBtn(onTap: (){
            logout();
          }),
          ThemeUtil.height(),
        ],
      ),
    ).animate().scale(duration: 200.ms);
  }

  Widget itemBtn(Icon icon, String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          icon,
        ],
      ),
    );
  }
}
