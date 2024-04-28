import 'package:app_template/theme/my_theme.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData pink() {
    return Pink().theme();
  }
}

class Pink extends MyTheme{
  @override
  Color background() {
    return const Color.fromARGB(255, 246, 246, 246);
  }
  @override
  Color onBackground() {
    return Colors.black;
  }
  @override
  Color primary() {
    return const Color.fromARGB(255, 246, 184, 184);
  }


}