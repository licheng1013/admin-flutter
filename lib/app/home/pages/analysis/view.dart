import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AnalysisPage extends StatelessWidget {
  AnalysisPage({Key? key}) : super(key: key);

  final logic = Get.put(AnalysisLogic());
  final state = Get.find<AnalysisLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "这是Logo页面，可自行从代码内自定义",
        style: TextStyle(fontSize: 28),
      ),
    );
  }

  static SidebarTree newThis(){
    return SidebarTree(
        name: "Logo 部分",
        icon: const Icon(Icons.home),
        page: AnalysisPage()
    );
  }
}
