import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PaginationPage extends StatelessWidget {
  PaginationPage({Key? key}) : super(key: key);

  final logic = Get.put(PaginationLogic());
  final state = Get.find<PaginationLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Text("分页组件");
  }
}
