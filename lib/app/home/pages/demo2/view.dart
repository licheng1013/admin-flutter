import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Demo2Page extends StatelessWidget {
  Demo2Page({Key? key}) : super(key: key);
  final logic = Get.put(Demo2Logic());

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: Container(
              height: 300,
              width: double.infinity,
              color: UiTheme.primary(),
              child: Center(
                  child: Text("吸顶示例",
                      style: TextStyle(
                        color: UiTheme.onPrimary(),
                      ))),
            ),
          )
        ];
      },
      body: Column(
        children: [
          const Text("评论数据"),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50.0,
                  child: Center(child: Text('Item $index')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(
      name: "吸顶示例",
      icon: Icons.view_list,
      page: Demo2Page(),
    );
  }
}
