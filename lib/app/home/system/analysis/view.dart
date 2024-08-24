import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/component/ui_edit.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AnalysisPage extends StatelessWidget {
  AnalysisPage({Key? key}) : super(key: key);

  final logic = Get.put(AnalysisLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ThemeUtil.height(),
        const Center(
          child: Text(
            "这是Logo页面，可自行从代码内自定义",
            style: TextStyle(fontSize: 28),
          ),
        ),
        ThemeUtil.height(),
        Expanded(
          child: Row(
            children: [
              Expanded(child: chart()),
              ThemeUtil.width(),
              Expanded(child: barChart()),
            ],
          ),
        ),
        const Spacer()
      ],
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(
        name: "Logo 部分", icon: Icons.logo_dev, page: AnalysisPage());
  }

  Widget chart() {
    return Obx(() {
      return LineChart(
        LineChartData(
          titlesData: const FlTitlesData(
              topTitles: AxisTitles(),
              leftTitles: AxisTitles(),
              //bottomTitles: AxisTitles(),
              rightTitles: AxisTitles()),
          lineBarsData: [
            LineChartBarData(
              spots: logic.dataPoints.toList(),
              color: UiTheme.primary(),
              belowBarData: BarAreaData(
                  show: true, color: UiTheme.primary().withAlpha(30)),
            ),
          ],
        ),
      );
    });
  }

  // 柱状图
  Widget barChart() {
    return Obx(() {
      return BarChart(
        BarChartData(
            titlesData: const FlTitlesData(
                topTitles: AxisTitles(),
                //leftTitles: AxisTitles(),
                //bottomTitles: AxisTitles(),
                rightTitles: AxisTitles()
            ),
            barGroups: logic.listBarData.toList()),
      );
    });
  }
}
