import 'package:app_template/app/home/head/view.dart';
import 'package:app_template/app/home/pages/analysis/view.dart';
import 'package:app_template/app/home/sidebar/view.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeadPage(),
          Expanded(
            child: Row(
              children: [
                SidebarPage(),
                ThemeUtil.lineV(),
                Expanded(child: AnalysisPage())
              ],
            ),
          )
        ],
      ),
    );
  }
}
