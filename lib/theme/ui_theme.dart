import 'package:admin_flutter/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiTheme {

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

  static Widget loading() {
    return Center(
      child:
      // 进度条
      SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          // 调整大小
          backgroundColor: UiTheme.onPrimary(),
          valueColor: AlwaysStoppedAnimation(UiTheme.primary()),
        ),
      ),
    );
  }
}
