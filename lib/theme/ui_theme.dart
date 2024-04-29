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
    return Get.theme.colorScheme.onBackground;
  }

  static Color background() {
    return Get.theme.colorScheme.background;
  }

  static Color primary() {
    return Get.theme.colorScheme.primary;
  }

  static Color border(){
    return onBackgroundCopy(d: 0.2);
  }

  static Color onBackgroundCopy({double d = 0.8}) {
    return onBackground().withAlpha((255 * d).toInt());
  }

  static Color getTextColor(bool b) {
    return b ? onBackground() : onBackgroundCopy();
  }

  static BoxDecoration decoration() {
    return BoxDecoration(
      color: background(),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      // 设置边框颜色
      border: Border.all(color: border()),
    );
  }

  /// 默认背景色的填充颜色
  static Color onBackground2() {
    return UiTheme.onBackgroundCopy(d: 0.08);
  }
}
