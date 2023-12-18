import 'package:app_template/app/home/pages/analysis/view.dart';
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
    SidebarTree(
      name: "首页3",
      icon: const Icon(Icons.home),
    ),
  ];

  static List<SidebarTree> childTreeList1 = [
    SidebarTree(
      name: "首页1-1",
      icon: const Icon(Icons.home),
      page: AnalysisPage(),
    ),
    SidebarTree(
      name: "首页2-1",
      icon: const Icon(Icons.home),
    ),
  ];

  static List<SidebarTree> childTreeList2 = [
    SidebarTree(
      name: "首页1-2",
      icon: const Icon(Icons.home),
      page: AnalysisPage(),
    ),
    SidebarTree(
      name: "首页2-2",
      icon: const Icon(Icons.home),
    ),
  ];

  var expansionTile = "".obs;
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
