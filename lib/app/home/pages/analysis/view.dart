import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AnalysisPage extends StatelessWidget {
  AnalysisPage({Key? key}) : super(key: key);

  final logic = Get.put(AnalysisLogic());
  final state = Get.find<AnalysisLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Text("分析页");
  }
}
