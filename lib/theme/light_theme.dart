import 'package:app_template/ex/ex_string.dart';
import 'package:app_template/theme/my_theme.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData pink() {
    return Light().theme();
  }
}

class Light extends MyTheme {
  @override
  Color background() {
    return Colors.white;
  }

  @override
  Color onBackground() {
    return Colors.black;
  }

  @override
  Color primary() {
    return const Color.fromARGB(255, 229, 233, 255);
  }



  @override
  String name() {
    return "亮色";
  }

  @override
  Color onPrimary() {
    return "#516bfa".toColor();
  }
}
