import 'package:app_template/common/message_util.dart';
import 'package:app_template/component/form/form_data.dart';
import 'package:app_template/component/pagination/view.dart';
import 'package:app_template/component/table/table_data.dart';
import 'package:app_template/component/table/view.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);

  final logic = Get.put(UserLogic());
  final state = Get.find<UserLogic>().state;

  @override
  Widget build(BuildContext context) {
    var columns = [
      TableData.multipleSelect(
          selectList: (e) => {MessageUtil.show("选择了: ${e.length} 个")}),
      TableData.index(),
      ColumnData(title: "姓名", key: "name"),
      ColumnData(title: "年龄", key: "age"),
      ColumnData(title: "性别", key: "sex"),
      ColumnData(title: "手机", key: "tel"),
    ];

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                  onPressed: () {
                    requestForm(logic.form,
                        submit: (d) => {MessageUtil.show(d.toString())});
                  },
                  child: const Text("新增")),
              ThemeUtil.rowWidth(),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            return TablePage(
              tableData: TableData(
                  isIndex: true, columns: columns, rows: logic.list.value),
            );
          }),
        ),
        PaginationPage(
          total: logic.total,
          changed: (size, page) {
            logic.find(size, page);
          },
        )
      ],
    );
  }
}
