import 'package:flutter/material.dart';

class UiUtil {
  /// 水平线
  static Widget hDivider() {
    return const Divider(
      height: 1,
    );
  }

  /// 垂直线
  static Widget vDivider() {
    return const VerticalDivider(
      width: 1,
    );
  }
}
