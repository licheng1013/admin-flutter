import 'package:app_template/common/assets_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LaunchPage extends StatelessWidget {
  LaunchPage({Key? key}) : super(key: key);

  final logic = Get.put(LaunchLogic());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100,),
            Text("启动闪屏")
          ],
        ),
      ),
    );
  }
}
