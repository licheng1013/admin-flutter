import 'dart:math';

import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class AnalysisLogic extends GetxController {
  var dataPoints = <FlSpot>[
    const FlSpot(0, 0),
    const FlSpot(2, 2),
    const FlSpot(4, 4),
    const FlSpot(5, 5),
    const FlSpot(7, 7),
  ].obs;

  var listBarData = <BarChartGroupData>[].obs;

  @override
  void onInit() {
    super.onInit();

    for (var i = 0; i < 6; i++) {
      var num = Random().nextInt(1000);
      listBarData.add(BarChartGroupData(
        x: num,
        barRods: [
          BarChartRodData(
            toY: num.toDouble(),
            color: UiTheme.primary(),
          ),
        ],
      ));
    }

    // 3000.toTimer((t) {
    //   var num = Random().nextInt(1000);
    //   listBarData.removeAt(0);
    //   listBarData.add(BarChartGroupData(
    //     x: num,
    //     barRods: [
    //       BarChartRodData(
    //         toY: num.toDouble(),
    //         color: UiTheme.primary(),
    //       ),
    //     ],
    //   ));
    // });
  }
}
