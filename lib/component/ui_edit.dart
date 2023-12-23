import 'package:app_template/component/form/form_data.dart';
import 'package:app_template/component/form/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiEdit {
  static void requestForm(FormDto form,
      {Function(Map<String, dynamic>)? submit}) {
    // 打开全屏窗口
    Get.dialog(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
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
    ));
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
            title: Text(title),
            content: content,
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Get.back();
                    cancel?.call();
                  },
                  child: const Text("取消")),
              FilledButton(
                  onPressed: () {
                    Get.back();
                    submit?.call();
                  },
                  child: const Text("确认")),
            ],
          );
        });
  }
}
