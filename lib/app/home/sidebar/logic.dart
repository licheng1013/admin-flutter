import 'package:app_template/app/home/pages/about/view.dart';
import 'package:app_template/app/home/pages/admin/view.dart';
import 'package:app_template/app/home/pages/analysis/view.dart';
import 'package:app_template/app/home/pages/settings/view.dart';
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
    AnalysisPage.newThis(),
    SidebarTree(
      name: "测试页面",
      icon: const Icon(Icons.expand),
      children: testTree,
    ),
    UserPage.newThis(),
    SettingsPage.newThis(),
  ];


  static List<SidebarTree> testTree = [
    AdminPage.newThis(),
    AboutPage.newThis(),
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
      child: Center(
          child: Text(
        "空",
        style: TextStyle(fontSize: 26),
      )),
    ),
  });
}
