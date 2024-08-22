import 'package:app_template/app/home/head/logic.dart';
import 'package:app_template/app/home/pages/settings/view.dart';
import 'package:app_template/common/message_util.dart';
import 'package:app_template/ex/ex_btn.dart';
import 'package:app_template/ex/ex_int.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PaginationPage extends StatelessWidget {
  final MainAxisAlignment alignment;

  PaginationPage(
      {super.key,
      this.alignment = MainAxisAlignment.end,
      int total = 0,
      required Function(int size, int page) changed}) {
    logic.total = total;
    logic.changed = changed;
    // 首次需要延迟加载
    128.toDelay(() {
      logic.reload();
    });
  }

  final logic = Get.put(PaginationLogic());

  final sizeList = [10, 15, 20, 50];

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(fontSize: 18);
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          //下拉选择器
          ThemeUtil.width(),
          Text("共 ${logic.total} 条", style: style),
          ThemeUtil.width(),
          Obx(() {
            return Text("当前页 ${logic.current}", style: style);
          }),
          ThemeUtil.width(),
          Text("选择数量 ", style: style),
          ThemeUtil.width(),
          Obx(() {
            return DropdownButton(
              focusColor: UiTheme.background(),
              items: [
                for (int i = 0; i < sizeList.length; i++)
                  DropdownMenuItem(
                      value: sizeList[i],
                      child: Center(child: Text("${sizeList[i]}"))),
              ],
              onChanged: (value) {
                logic.size.value = value as int;
                logic.current.value = 1;
                logic.reload();
              },
              value: logic.size.value,
              // 设置颜色
              style: style.copyWith(color: UiTheme.onBackground()),
              underline: Container(),
              // 设置宽度
            );
          }),

          ThemeUtil.width(),
          Obx(() {
            return SizedBox(
              width: 75,
              child: Center(
                child: Text("总 ${logic.totalPage.value} 页", style: style),
              ),
            );
          }),
          ThemeUtil.width(),
          "上一页".toBtn(
            // 禁用
            onTap: logic.prev,
          ),
          ThemeUtil.width(),
          "下一页".toBtn(onTap: logic.next),
          ThemeUtil.width(),
        ],
      ),
    );
  }


}
