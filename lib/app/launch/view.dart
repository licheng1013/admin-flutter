import 'package:app_template/common/assets_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LaunchPage extends StatelessWidget {
  LaunchPage({Key? key}) : super(key: key);

  final logic = Get.put(LaunchLogic());
  final state = Get.find<LaunchLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsUtil.bgImage,
              height: 200,
              width: 400,
            ),
            const Text("启动闪屏")
          ],
        ),
      ),
    );
  }
}
