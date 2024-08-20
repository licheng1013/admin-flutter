import 'dart:math';

import 'package:app_template/app/home/pages/about/view.dart';
import 'package:app_template/app/home/pages/admin/view.dart';
import 'package:app_template/app/home/pages/analysis/view.dart';
import 'package:app_template/app/home/pages/rich_text/view.dart';
import 'package:app_template/app/home/pages/settings/view.dart';
import 'package:app_template/app/home/pages/user/view.dart';
import 'package:app_template/common/assets_util.dart';
import 'package:app_template/component/upload/view.dart';
import 'package:app_template/ex/ex_int.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SidebarLogic extends GetxController {
  static var selectName = "".obs;
  static Widget selectPage = const SizedBox(
    child: Text("空"),
  );
  static var isExpanded = true.obs;
  static var isExpandedAnim = true.obs;
  var animName = "".obs;
  var expansionTile = <String>[].obs;

  /// 面包屑列表
  static var breadcrumbList = <SidebarTree>[].obs;

  static List<SidebarTree> treeList = [
    AnalysisPage.newThis(),
    SidebarTree(
      name: "测试页面",
      icon: Icons.expand,
      children: testTree,
    ),
    UserPage.newThis(),
    SettingsPage.newThis(),
    RichTextPage.newThis(),
  ];

  static void selSidebarTree(SidebarTree sel){
    breadcrumbList.clear();
    32.toDelay((){
      for(var item in treeList){
        if (item.name == sel.name) {
          breadcrumbList.add(item);
          break;
        }
        for(var child in item.children){
          if(child.name == sel.name){
            breadcrumbList.add(item);
            breadcrumbList.add(child);
            break;
          }
        }
      }
    });
  }


  static List<SidebarTree> testTree = [
    AdminPage.newThis(),
    AboutPage.newThis(),
    SidebarTree(
      name: "上传组件",
      icon: Icons.home,
      page: Center(
        child: Column(
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
    ),
  ];
}

class SidebarTree {
  final String name;
  final IconData icon;
  final List<SidebarTree> children;
  final bool isExpanded;
  final Widget page;

  SidebarTree({
    required this.name,
    this.icon = Icons.ac_unit,
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
