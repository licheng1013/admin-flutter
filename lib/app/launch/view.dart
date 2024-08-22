import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LaunchPage extends StatelessWidget {
  LaunchPage({Key? key}) : super(key: key);

  final logic = Get.put(LaunchLogic());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: UiTheme.loading(),
    );
  }
}
