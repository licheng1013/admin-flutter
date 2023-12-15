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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/image.png",
            height: 200,
            width: 400,
          ),
          const Text("启动闪屏")
        ],
      ),
    );
  }
}
