import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/component/table/ex.dart';
import 'package:admin_flutter/ex/ex_btn.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'logic.dart';

class Demo3Page extends StatelessWidget {
  Demo3Page({Key? key}) : super(key: key);
  final logic = Get.put(Demo3Logic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableEx.actions(children: [
          ThemeUtil.width(),
          Obx(() {
            return Text("数据量:${logic.dbList.length}");
          }),
          ThemeUtil.width()
        ]),
        ThemeUtil.lineH(),
        Expanded(
          child: PagedListView<int, String>(
            scrollController: logic.scrollController,
            padding: EdgeInsets.zero,
            pagingController: logic.pagingController,
            builderDelegate: PagedChildBuilderDelegate<String>(
                itemBuilder: (context, item, index) =>
                    SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Center(child: Text(item)),
                            ),
                            "删除".toBtn(onTap: () {
                              logic.delete(index);
                            }),
                            ThemeUtil.width(),
                            "插入".toBtn(onTap: () {
                              logic.add(index);
                            }),
                            ThemeUtil.width()
                          ],
                        ))),
          ),
        ),
      ],
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(
      name: "无限滚动",
      icon: Icons.list_alt,
      page: Demo3Page(),
    );
  }
}
