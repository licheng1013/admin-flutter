import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/component/pagination/view.dart';
import 'package:admin_flutter/component/table/ex.dart';
import 'package:admin_flutter/component/table/table_data.dart';
import 'package:admin_flutter/component/table/view.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AdminPage extends StatelessWidget {
  AdminPage({Key? key}) : super(key: key);

  final logic = Get.put(AdminLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableEx.actions(
          children: [
            ThemeUtil.width(),
            const Text(
              "运行mock目录下的服务器体验",
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            FilledButton(
                onPressed: () {
                  logic.add();
                },
                child: const Text("新增")),
            ThemeUtil.width(),
          ],
        ),
        ThemeUtil.lineH(),
        Expanded(
          child: Obx(() {
            return TablePage(
              loading: logic.loading.value,
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
              logic.find(size, page);
            },
          );
        })
      ],
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(
      name: "管理列表",
      icon: Icons.deblur,
      page: AdminPage(),
    );
  }
}
