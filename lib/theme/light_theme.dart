import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData pink() {
    return ThemeData(
      fontFamily: 'MyFont',
      scaffoldBackgroundColor: bg, // 背景颜色
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        background: bg, // 背景颜色
        primary: primary, // 按钮背景色
        onPrimary: on, // 影响按钮内的文字颜色
        onBackground: on, // 背景上的颜色
      ),
      useMaterial3: true,
    );
  }

  static const primary = Color.fromARGB(255, 246, 246, 246);
  static const bg = Color.fromARGB(255, 246, 246, 246);
  static const on = Colors.black;

}
