import 'package:admin_flutter/ex/ex_string.dart';
import 'package:admin_flutter/theme/my_theme.dart';
import 'package:flutter/material.dart';

abstract class MyDark extends MyTheme{
  @override
  Brightness brightness() {
    return Brightness.dark;
  }
}

class Dark extends MyDark {
  @override
  Color background() {
    return const Color.fromARGB(255, 27, 38, 44);
  }
  @override
  Color onBackground() {
    return Colors.white;
  }
  @override
  String name() {
    return "深色";
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


class Dark1 extends MyDark {
  @override
  Color background() {
    return const Color.fromARGB(255, 27, 38, 44);
  }
  @override
  Color onBackground() {
    return Colors.white;
  }
  @override
  String name() {
    return "黄色";
  }
  @override
  Color primary() {
    return "#febc45".toColor();
  }

  @override
  Color onPrimary() {
    return Colors.black;
  }
}

class Dark2 extends MyDark {
  @override
  Color background() {
    return "#222831".toColor();
  }
  @override
  Color onBackground() {
    return Colors.white;
  }
  @override
  String name() {
    return "青色";
  }
  @override
  Color primary() {
    return "#18adb4".toColor();
  }

  @override
  Color onPrimary() {
    return "#eeeeee".toColor();
  }
}