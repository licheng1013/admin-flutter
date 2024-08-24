import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/common/assets_util.dart';
import 'package:admin_flutter/component/upload/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class DemoPage extends StatelessWidget {
  DemoPage({Key? key}) : super(key: key);
  final logic = Get.put(DemoLogic());

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(
      name: "上传组件",
      icon: Icons.home,
      page: DemoPage(),
    );
  }
}
