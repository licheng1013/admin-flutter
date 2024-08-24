import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  final logic = Get.put(AboutLogic());

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "关于",
            style: TextStyle(fontSize: 28),
          ),
          Text(
            "  此项目是基于Flutter构建的，并封装了一些常用组件，例如 分页,表格,上传组件 等等。\n"
            "未来还将继续优化此项目",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  static SidebarTree newThis(){
    return SidebarTree(
        name: "关于信息",
        icon: Icons.info,
        page: AboutPage()
    );
  }
}
