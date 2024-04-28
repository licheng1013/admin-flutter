import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/material.dart';

class ThemeUtil {
  /// 圆角
  static BoxDecoration boxDecoration(
      {Color? color, double radius = 6, Color? border}) {
    // 圆角
    return BoxDecoration(
      color: color,
      // 边框颜色
      border: border != null ? Border.all(color: border) : null,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
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
  static Widget lineH({double height = 1}) {
    return Divider(
      height: height,
      color: UiTheme.border(),
    );
  }

  /// 垂直线
  static Widget lineV({double width = 1}) {
    return VerticalDivider(
      width: width,
      color: UiTheme.border(),
    );
  }
}
