import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:app_template/common/url_util.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ThemeUtil.rowWidth(),
              const Text(
                "这个需要后端来预览",
                style: TextStyle(fontSize: 18),
              ),
              ThemeUtil.rowWidth(),
              FilledButton(
                  onPressed: () {
                    UrlUtil.openUrl(
                        "https://github.com/licheng1013/gorm-template");
                  },
                  child: const Text("后端地址")),
              const Spacer(),
              FilledButton(
                  onPressed: () {
                    logic.add();
                  },
                  child: const Text("新增")),
              ThemeUtil.rowWidth(),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            return TablePage(
              loading: logic.loading.value,
              tableData: TableData(
                  isIndex: true,
                  columns: logic.columns,
                  rows: logic.list.value),
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


  static SidebarTree newThis(){
    return SidebarTree(
      name: "管理列表",
      icon: Icons.deblur,
      page: AdminPage(),
    );
  }
}
