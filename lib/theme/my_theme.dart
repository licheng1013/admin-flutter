import 'package:flutter/material.dart';

abstract class MyTheme {
  ThemeData theme() {
    return ThemeData(
      fontFamily: 'MyFont',
      scaffoldBackgroundColor: background(), // 背景颜色
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness(),
        seedColor: primary(),
        background: background(),
        // 背景颜色
        primary: primary(),
        // 按钮背景色
        onPrimary: onBackground(),
        // 影响按钮内的文字颜色
        onBackground: onBackground(), // 背景上的颜色
      ),
      useMaterial3: true,
    );
  }

  Color primary();

  Color background();

  Color onBackground();

  Brightness brightness() {
    return Brightness.light;
  }
}
