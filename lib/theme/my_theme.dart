import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyTheme {
  ThemeData theme() {
    // 判断是不是Windows，如果是则使用微软雅黑
    String? fontFamily;
    if (GetPlatform.isWindows) {
      fontFamily = "Microsoft YaHei UI";
    }

    return ThemeData(
      fontFamily: fontFamily,
      scaffoldBackgroundColor: background(), // 背景颜色
      tabBarTheme: TabBarTheme(
        labelColor: onBackground(),
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness(),
        seedColor: primary(),
        surface: background(),
        // 背景颜色
        primary: primary(),
        // 按钮背景色
        onPrimary: onBackground(),
        // 影响按钮内的文字颜色
        onSurface: onBackground(), // 背景上的颜色
      ),
      useMaterial3: true,
    );
  }

  /// 主色
  Color primary();
  /// 背景颜色
  Color background();
  /// 背景上的颜色
  Color onBackground();
  /// 模式
  Brightness brightness() {
    return Brightness.light;
  }
  /// 主题名称
  String name();
}
