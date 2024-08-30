import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/component/pagination/view.dart';
import 'package:admin_flutter/component/table/ex.dart';
import 'package:admin_flutter/component/table/table_data.dart';
import 'package:admin_flutter/component/table/view.dart';
import 'package:admin_flutter/ex/ex_btn.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);

  final logic = Get.put(UserLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableEx.actions(
          children: [
            SizedBox(
              width: 150,
              child: TableEx.input(tip: "搜索姓名", onChanged: logic.nameChanged),
            ),
            ThemeUtil.width(),
            Obx(() {
              return SegmentedButton(
                selected: logic.sexSel.toSet(),
                emptySelectionAllowed: true,
                segments: const [
                  ButtonSegment(label: Text("男"), value: 1),
                  ButtonSegment(label: Text("女"), value: 0),
                ],
                onSelectionChanged: (e) {
                  logic.sexSel.clear();
                  logic.sexSel.addAll(e);
                  logic.find();
                },
              );
            }),
            ThemeUtil.width(),
            "多选删除".toBtn(onTap: logic.deleteSel),
            ThemeUtil.width(),
            "新增".toBtn(onTap: logic.add),
            ThemeUtil.width(),
          ],
        ),
        ThemeUtil.lineH(),
        Expanded(
          child: Obx(() {
            return TablePage(
              tableData: TableData(
                  isIndex: true,
                  columns: logic.columns,
                  rows: logic.list.toList()),
            );
          }),
        ),
        Obx(() {
          return PaginationPage(
            total: logic.total.value,
            changed: (size, page) {
              logic.size = size;
              logic.page = page;
              logic.find();
            },
          );
        })
      ],
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(name: "用户列表", icon: Icons.person, page: UserPage());
  }
}
