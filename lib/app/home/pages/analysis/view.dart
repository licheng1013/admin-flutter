import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AnalysisPage extends StatelessWidget {
  AnalysisPage({Key? key}) : super(key: key);

  final logic = Get.put(AnalysisLogic());
  final state = Get.find<AnalysisLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            ThemeUtil.rowHeight(),
            Row(
              children: [
                _card(),
                ThemeUtil.rowWidth(),
                _card(),
                ThemeUtil.rowWidth(),
                _card(),
                ThemeUtil.rowWidth(),
                _card(),
              ],),
            ThemeUtil.rowHeight(),
            _sale(),
            ThemeUtil.rowHeight(),
            _sale(),
            ThemeUtil.rowHeight(),
            _sale(),
            ThemeUtil.rowHeight(),
          ],
        ));
  }
  Widget _sale(){
    return Container(
      width: double.infinity,
      decoration: UiTheme.decoration(),
      height: 415,
      child:  const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("分析页",style: textStyle,),
        ],
      ),
    );
  }

  static const textStyle = TextStyle( fontSize: 18);

  Widget _card(){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: UiTheme.decoration(),
        height: 180,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("分析页",style: textStyle),
          ],
        ),
      ),
    );
  }
}
