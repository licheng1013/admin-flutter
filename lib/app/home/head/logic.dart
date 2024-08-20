import 'package:app_template/app/login/view.dart';
import 'package:app_template/common/app_data.dart';
import 'package:app_template/common/message_util.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Transform.translate(
                offset: const Offset(-36, 30),
                child: Container(
                  width: 200,
                  decoration: UiTheme.decoration(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      FilledButton(
                          onPressed: () {
                            MessageUtil.show("还在制作中...");
                          },
                          child: const Text("帮助按钮")),
                      ThemeUtil.rowHeight(),
                      FilledButton(
                          onPressed: () {
                            logout();
                          },
                          child: const Text("退出登入")),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
