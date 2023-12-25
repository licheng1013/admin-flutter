import 'package:app_template/app/home/pages/about/view.dart';
import 'package:app_template/app/home/pages/admin/view.dart';
import 'package:app_template/app/home/pages/analysis/view.dart';
import 'package:app_template/app/home/pages/flutter/view.dart';
import 'package:app_template/app/home/pages/user/view.dart';
import 'package:app_template/common/assets_util.dart';
import 'package:app_template/component/upload/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class SidebarLogic extends GetxController {
  final SidebarState state = SidebarState();
  static var selectName = "".obs;
  static Widget selectPage = const SizedBox(
    child: Text("空"),
  );
  static var isExpanded = true.obs;
  static var isExpandedAnim = true.obs;
  var expansionTile = <String>[].obs;

  static List<SidebarTree> treeList = [
    SidebarTree(
      name: "数据总览",
      icon: const Icon(Icons.home),
      children: childTreeList1,
    ),
    SidebarTree(
      name: "测试页面",
      icon: const Icon(Icons.expand),
      children: testTree,
    ),
    SidebarTree(name: "用户列表", icon: const Icon(Icons.home), page: UserPage()),
    SidebarTree(
        name: "Flutter",
        icon: const Icon(Icons.flutter_dash),
        page: FlutterPage()),
  ];

  static List<SidebarTree> childTreeList1 = [
    SidebarTree(
      name: "分析页",
      icon: const Icon(Icons.home),
      page: AnalysisPage(),
    ),
    SidebarTree(name: "关于项目", icon: const Icon(Icons.home), page: AboutPage()),
  ];

  static List<SidebarTree> testTree = [
    SidebarTree(
      name: "管理列表",
      icon: const Icon(Icons.home),
      page: AdminPage(),
    ),
    SidebarTree(
      name: "上传组件",
      icon: const Icon(Icons.home),
      page: Column(
        children: [
          const Text(
            "当前限制只能上传10张图片",
            style: TextStyle(fontSize: 28),
          ),
          SizedBox(
              width: 500,
              child: UploadPage(
                limit: 10,
                multiple: true,
                type: AssetsUtil.image(),
              )),
        ],
      ),
    ),
    for(int i=0;i<15;i++)
      SidebarTree(
        name: "test$i",
        icon: const Icon(Icons.home),
        page: Center(child: Text("测试$i",style: const TextStyle(fontSize: 26),),)
      ),
  ];
}

class SidebarTree {
  final String name;
  final Icon icon;
  final List<SidebarTree> children;
  final bool isExpanded;
  final Widget page;

  SidebarTree({
    required this.name,
    this.icon = const Icon(Icons.ac_unit),
    this.children = const [],
    this.isExpanded = false,
    this.page = const SizedBox(
      child: Center(child: Text("空",style: TextStyle(fontSize: 26),)),
    ),
  });
}
