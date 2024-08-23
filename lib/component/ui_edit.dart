import 'package:admin_flutter/component/form/form_data.dart';
import 'package:admin_flutter/component/form/view.dart';
import 'package:admin_flutter/ex/ex_btn.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class UiEdit {
  static void requestForm(FormDto form,
      {Function(Map<String, dynamic>)? submit}) {
    // 打开全屏窗口
    Get.dialog(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: UiTheme.background(),
          child: SizedBox(
              width: 600,
              child: FormPage(
                form,
                back: () {
                  Get.back();
                },
                submit: (data) {
                  submit?.call(data);
                },
              )),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    ).animate().fade());
  }

  static void confirm(
      {String title = "提示",
      Widget content = const Text("正在进行操作"),
      Function()? submit,
      Function()? cancel}) {
    // 打开一个确认取消窗口
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            backgroundColor: UiTheme.background(),
            title: Text(title),
            content: content,
            actions: [
              "取消".toOutlineBtn(onTap: () {
                Get.back();
                cancel?.call();
              }),
              "确认".toBtn(onTap: () {
                Get.back();
                submit?.call();
              }),
            ],
          );
        });
  }
}
