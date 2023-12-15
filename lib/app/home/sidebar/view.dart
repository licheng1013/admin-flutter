import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SidebarPage extends StatelessWidget {
  SidebarPage({Key? key}) : super(key: key);

  final logic = Get.put(SidebarLogic());
  final state = Get.find<SidebarLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 250,);
  }
}
