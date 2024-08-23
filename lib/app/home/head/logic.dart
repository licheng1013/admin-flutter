import 'package:admin_flutter/app/login/view.dart';
import 'package:admin_flutter/common/app_data.dart';
import 'package:admin_flutter/ex/ex_anim.dart';
import 'package:admin_flutter/ex/ex_btn.dart';
import 'package:admin_flutter/ex/ex_hint.dart';
import 'package:admin_flutter/ex/ex_url.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
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
            "https://github.com/licheng1013/admin-flutter".toOpenUrl();
          }),
          ThemeUtil.height(),
          "M3示例".toBtn(onTap: (){
            "https://flutterweb-wasm.web.app/".toOpenUrl();
          }),
          ThemeUtil.height(),
          "帮助按钮".toBtn(onTap: (){
            "还在制作中...".toHint();
          }),
          ThemeUtil.height(),
          "退出登入".toBtn(onTap: (){
            logout();
          }),
          ThemeUtil.height(),
        ],
      ),
    ).toFadeInWithMoveX(true);
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
