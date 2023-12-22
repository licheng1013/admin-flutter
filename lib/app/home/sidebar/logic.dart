import 'package:app_template/app/home/pages/admin/view.dart';
import 'package:app_template/app/home/pages/analysis/view.dart';
import 'package:app_template/app/home/pages/flutter/view.dart';
import 'package:app_template/app/home/pages/user/view.dart';
import 'package:app_template/component/form/view.dart';
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
      name: "首页1",
      icon: const Icon(Icons.home),
      page: AnalysisPage(),
      children: childTreeList1,
    ),
    SidebarTree(
      name: "首页2",
      icon: const Icon(Icons.home),
      children: childTreeList2,
    ),
    SidebarTree(name: "用户列表", icon: const Icon(Icons.home), page: UserPage()),
    SidebarTree(
        name: "Flutter",
        icon: const Icon(Icons.flutter_dash),
        page: FlutterPage()),
  ];

  static List<SidebarTree> childTreeList1 = [
    SidebarTree(
      name: "首页1-1",
      icon: const Icon(Icons.home),
      page: AnalysisPage(),
    ),
    SidebarTree(
        name: "表单页面",
        icon: const Icon(Icons.home),
        page: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Card(
              child: SizedBox(width: 500, child: FormPage()),
            ),
          ],
        )),
  ];

  static List<SidebarTree> childTreeList2 = [
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
          SizedBox(width: 500, child: UploadPage()),
        ],
      ),
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
      child: Text("空"),
    ),
  });
}
