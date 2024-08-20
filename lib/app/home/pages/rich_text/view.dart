import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class RichTextPage extends StatelessWidget {
  RichTextPage({Key? key}) : super(key: key);
  final logic = Get.put(RichTextLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FleatherToolbar.basic(controller: logic.controller),
          Expanded(
            child: Center(
              child: Container(
                width: 800,
                decoration: UiTheme.decoration(),
                height: double.infinity,
                child: FleatherEditor(controller: logic.controller)),
            ),
          ),
          //or
          //FleatherField(controller: logic.controller)
        ],
      ),
    );
  }

   static SidebarTree newThis(){
    return SidebarTree(
        name: "富文本",
        icon: Icons.text_fields,
        page: RichTextPage()
    );
  }
}
