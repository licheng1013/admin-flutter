
import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/component/pagination/view.dart';
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
      TableData.multipleSelect(
          selectList: (e)  {
            logic.selList.value = e;
          }),
      ColumnData(title: "Id", key: "id"),
      ColumnData(title: "姓名", key: "name"),
      ColumnData(title: "年龄", key: "age"),
      ColumnData(title: "性别", key: "sex"),
      ColumnData(title: "手机", key: "tel"),
      TableData.edit(delete: logic.delete, edit: logic.updateData),
    ];

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              "多选删除".toBtn(onTap: logic.deleteSel),
              ThemeUtil.width(),
              "新增".toBtn(onTap: logic.add),
              ThemeUtil.width(),
            ],
          ),
        ),
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
