import 'package:admin_flutter/ex/ex_string.dart';
import 'package:admin_flutter/theme/my_theme.dart';
import 'package:flutter/material.dart';


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
  String name() {
    return "亮色";
  }
  @override
  Color primary() {
    return "#516bfa".toColor();
  }
  @override
  Color onPrimary() {
    return const Color.fromARGB(255, 229, 233, 255);
  }
}


class Light1 extends MyTheme {
  @override
  Color background() {
    return Colors.white;
  }
  @override
  Color onBackground() {
    return Colors.black;
  }
  @override
  String name() {
    return "红色";
  }
  @override
  Color primary() {
    return "#fd5b5f".toColor();
  }

  @override
  Color onPrimary() {
    return const Color.fromARGB(255, 229, 233, 255);
  }

}

class Light2 extends MyTheme {
  @override
  Color background() {
    return "#feeac7".toColor();
  }
  @override
  Color onBackground() {
    return Colors.black;
  }

  @override
  String name() {
    return "咖啡色";
  }

  @override
  Color primary() {
    return "#5f3f28".toColor();
  }

  @override
  Color onPrimary() {
    return Colors.white;
  }

}