import 'package:app_template/common/message_util.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PaginationPage extends StatelessWidget {
  final MainAxisAlignment alignment;
  final Function(int size, int page)? changed;
  final int total;

  PaginationPage(
      {Key? key,
      this.alignment = MainAxisAlignment.end,
      this.total = 0,
      this.changed})
      : super(key: key);

  final logic = Get.put(PaginationLogic());

  final sizeList = [10, 15, 20, 50];
  var size = 10.obs;
  var current = 1.obs;
  var totalPage = 0.obs;

  @override
  Widget build(BuildContext context) {
    Future.delayed(60.milliseconds, () {
      refresh();
    });

    return Card(
      borderOnForeground: true,
      color: UiTheme.background(),
      shadowColor: UiTheme.primary(),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            //下拉选择器
            ThemeUtil.rowWidth(),
            Obx(() {
              return Text("当前页 $current", style: const TextStyle(fontSize: 18));
            }),
            ThemeUtil.rowWidth(),
            const Text("选择数量 ", style: TextStyle(fontSize: 18)),
            ThemeUtil.rowWidth(),
            Obx(() {
              return DropdownButton(
                items: [
                  for (int i = 0; i < sizeList.length; i++)
                    DropdownMenuItem(
                        value: sizeList[i],
                        child: Center(child: Text("${sizeList[i]}"))),
                ],
                onChanged: (value) {
                  size.value = value as int;
                  current.value = 1;
                  refresh();
                },
                value: size.value,
                // 设置颜色
                style:  TextStyle(fontSize: 18, color: UiTheme.onBackground()),
                underline: Container(),
                // 设置宽度
              );
            }),

            ThemeUtil.rowWidth(),
            Obx(() {
              return SizedBox(
                width: 75,
                child: Center(
                  child: Text(
                    "总 ${totalPage.value} 页",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            }),
            ThemeUtil.rowWidth(),
            FilledButton(
                // 禁用
                onPressed: () {
                  if (current.value == 1) {
                    MessageUtil.show("已经是第一页了");
                    return;
                  }
                  current.value--;
                  refresh();
                },
                child: const Text("上一页")),
            ThemeUtil.rowWidth(),
            FilledButton(
                onPressed: () {
                  if (current.value == totalPage.value) {
                    MessageUtil.show("已经是最后一页了");
                    return;
                  }
                  current.value++;
                  refresh();
                },
                child: const Text("下一页")),
            ThemeUtil.rowWidth(),
          ],
        ),
      ),
    );
  }

  void refresh() {
    totalPage.value = total ~/ size.value + (total % size.value != 0 ? 1 : 0);
    changed?.call(size.value, current.value);
  }
}
