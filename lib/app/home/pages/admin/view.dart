import 'package:app_template/common/message_util.dart';
import 'package:app_template/component/form/form_data.dart';
import 'package:app_template/component/pagination/view.dart';
import 'package:app_template/component/table/table_data.dart';
import 'package:app_template/component/table/view.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AdminPage extends StatelessWidget {
  AdminPage({Key? key}) : super(key: key);

  final logic = Get.put(AdminLogic());
  final state = Get.find<AdminLogic>().state;

  @override
  Widget build(BuildContext context) {
    var columns = [
      TableData.multipleSelect(
          selectList: (e) => {MessageUtil.show("选择了: ${e.length} 个")}),
      TableData.index(),
      ColumnData(title: "Id", key: "id"),
      ColumnData(title: "账号", key: "userName"),
      ColumnData(title: "密码", key: "password"),
      ColumnData(title: "盐", key: "salt"),
      ColumnData(title: "创建时间", key: "createTime"),
      ColumnData(title: "昵称", key: "nickName"),
    ];

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("这个需要后端来预览"),
              ThemeUtil.rowWidth(),
              FilledButton(
                  onPressed: () {
                    submit();
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
