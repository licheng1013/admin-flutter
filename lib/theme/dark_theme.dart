import 'package:app_template/theme/my_theme.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData blue() {
    return Blue().theme();
  }
}

class Blue extends MyTheme {
  @override
  Color background() {
    return const Color.fromARGB(255, 27, 38, 44);
  }
  @override
  Color onBackground() {
    return Colors.white;
  }
  @override
  Color primary() {
    return const Color.fromARGB(255, 54, 131, 182);
  }
  @override
  Brightness brightness() {
    return Brightness.dark;
  }

  @override
  String name() {
    return "深色";
  }

}
