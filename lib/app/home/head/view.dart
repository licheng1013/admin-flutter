import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HeadPage extends StatelessWidget {
  HeadPage({Key? key}) : super(key: key);

  final logic = Get.put(HeadLogic());
  final state = Get.find<HeadLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              const Spacer(),
              IconButton(
                  onPressed: () {
                    logic.logout();
                  },
                  icon: const Icon(Icons.settings)),
              ThemeUtil.rowWidth(),
              OutlinedButton(
                  onPressed: () {
                    logic.logout();
                  },
                  child: const Text("帮助")),
              ThemeUtil.rowWidth(),
              OutlinedButton(
                  onPressed: () {
                    logic.logout();
                  },
                  child: const Text("退出登入")),
              ThemeUtil.rowWidth()
            ],
          ),
        ),
        ThemeUtil.lineH(),
      ],
    );
  }
}
