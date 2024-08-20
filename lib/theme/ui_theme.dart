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

  static Color onBackground() {
    return Get.theme.colorScheme.onSurface;
  }

  static Color background() {
    return Get.theme.colorScheme.surface;
  }

  static Color primary() {
    return Get.theme.colorScheme.primary;
  }

  static Color onPrimary() {
    return Get.theme.colorScheme.onPrimary;
  }

  static Color border(){
    return onBackgroundCopy(d: 0.2);
  }

  static Color onBackgroundCopy({double d = 0.6}) {
    return onBackground().withAlpha((255 * d).toInt());
  }

  static Color getTextColor(bool b) {
    return b ? onBackground() : onBackgroundCopy();
  }

  static BoxDecoration decoration({double radius = 8.0}) {
    return BoxDecoration(
      color: background(),
      borderRadius:  BorderRadius.all(Radius.circular(radius)),
      // 设置边框颜色
      border: Border.all(color: border()),
    );
  }

  /// 默认背景色的填充颜色
  static Color onBackground2() {
    return UiTheme.onBackgroundCopy(d: 0.08);
  }

  static getPrimary(bool selected) {
    return selected ? primary() : onBackgroundCopy();
  }

  static getOnPrimary(bool selected) {
    return selected ? onPrimary() : onBackground();
  }
}
