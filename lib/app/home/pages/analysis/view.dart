import 'package:app_template/theme/theme_util.dart';
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
        color: const Color.fromARGB(255, 245, 245, 245),
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
      color: Colors.white,
      width: double.infinity,
      height: 415,
      child:  const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("分析页",style: textStyle,),
        ],
      ),
    );
  }

  static const textStyle = TextStyle(color: Colors.black, fontSize: 18);

  Widget _card(){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(0),
        color: Colors.white,
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
