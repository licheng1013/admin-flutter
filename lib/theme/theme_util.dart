import 'package:flutter/material.dart';

class ThemeUtil {
  /// 圆角
  static BoxDecoration boxDecoration({Color? color}) {
    // 圆角
    return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(6)),
    );
  }

  /// 行高
  static SizedBox rowHeight({double? height = 12}) {
    return SizedBox(
      height: height,
    );
  }

  /// 行宽
  static SizedBox rowWidth({double? width = 12}) {
    return SizedBox(
      width: width,
    );
  }

  /// 水平线
  static Widget lineH({double height = 1, Color color = Colors.grey}) {
    return Divider(
      height: height,
      color: color,
    );
  }

  /// 垂直线
  static Widget lineV({double width = 1, Color color = Colors.grey}) {
    return VerticalDivider(
      width: width,
      color: color,
    );
  }
}
