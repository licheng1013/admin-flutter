import 'package:app_template/theme/theme_util.dart';
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
  final state = Get.find<PaginationLogic>().state;

  final sizeList = [10, 15, 20, 50];
  var size = 10.obs;
  var current = 1.obs;

  @override
  Widget build(BuildContext context) {
    Future.delayed(60.milliseconds, () {
      refresh();
    });

    return Card(
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            //下拉选择器
            ThemeUtil.rowWidth(),
            Obx(() {
              return Text("当前页 $current",
                  style: const TextStyle(color: Colors.black, fontSize: 18));
            }),
            ThemeUtil.rowWidth(),
            const Text("选择数量 ",
                style: TextStyle(color: Colors.black, fontSize: 18)),
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
                  refresh();
                },
                value: size.value,
                // 设置颜色
                style: const TextStyle(color: Colors.black, fontSize: 18),
                focusColor: Colors.transparent,
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
                    "总 ${total ~/ size.value + (total % size.value != 0 ? 1 : 0)} 页",
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              );
            }),
            ThemeUtil.rowWidth(),
            FilledButton(
              // 禁用
                onPressed: () {
                  current.value--;
                  refresh();
                },
                child: const Text("上一页")),
            ThemeUtil.rowWidth(),
            FilledButton(
                onPressed: () {
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
    if (current.value * size.value > total) {
      current.value = total ~/ size.value + (total % size.value != 0 ? 1 : 0);
    }
    if (current.value <= 0) {
      current.value = 1;
    }
    changed?.call(size.value, current.value);
  }
}
