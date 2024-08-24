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
    var columns = [
      TableEx.multipleSelect(
        selectList: (e) {
          logic.selList.value = e;
        },
      ),
      ColumnData(title: "Id", key: "id"),
      TableEx.switchTo("enable", changed: logic.changed),
      ColumnData(title: "姓名", key: "name"),
      ColumnData(title: "年龄", key: "age"),
      ColumnData(
          title: "性别",
          key: "sex",
          render: (v, d, i, t) {
            return Text(v == 1 ? "男" : "女");
          }),
      ColumnData(title: "手机", key: "tel"),
      TableEx.edit(delete: logic.delete, edit: logic.updateData),
    ];

    return Column(
      children: [
        SizedBox(
          height: 52,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
        ),
        ThemeUtil.lineH(),
        Expanded(
          child: Obx(() {
            return TablePage(
              tableData: TableData(
                  isIndex: true, columns: columns, rows: logic.list.toList()),
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
