import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiTheme {
  /// 开启圆角
  static var enableRoundedCorners = true.obs;

  static Widget roundedCorners({required Widget child}) {
    return Container(
      decoration: enableRoundedCorners.value
          ? ThemeUtil.boxDecoration(radius: 12, border: Colors.grey)
          : null,
      child: child,
    );
  }
}
