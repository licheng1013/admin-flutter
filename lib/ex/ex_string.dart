
import 'package:admin_flutter/common/image_util.dart';
import 'package:admin_flutter/ex/ex_int.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension ExString on String {
  /// 字符串转换为整数
  int toInt() {
    return int.tryParse(this) ?? 0;
  }

  /// 字符串转换为浮点数
  double toDouble() {
    return double.tryParse(this) ?? 0.0;
  }

  /// 字符串转换为日期
  DateTime toDate() {
    return DateTime.tryParse(this) ?? DateTime.now();
  }

  /// 字符串转换为布尔值
  bool toBool() {
    return toLowerCase() == 'true';
  }

  /// 转换为列表默认分割符号为,
  List<String> toList() {
    // 如果没有逗号则返回自身
    if (!contains(',')) return [this];
    return split(',');
  }

  /// 从16进制字符串转换为颜色
  Color toColor() {
    // 移除开头的#
    if (startsWith('#')) {
      return Color(int.parse(substring(1), radix: 16) + 0xFF000000);
    }
    return Color(int.parse(this, radix: 16) + 0xFF000000);
  }

  /// eq
  bool eq(String other) {
    return this == other;
  }

  /// 转换为image ，第三方库
  Widget toImage() {
    return ImageUtil.image(this);
  }

  /// 解析 2025-09-05T00:00:00Z 为 2025-09-05
  String toYMD() {
    var split = this.split("T");
    return split.first;
  }
}

// const Color white60 = Color(0x1elf22);
var c = "#52271f".toColor();

void exTest() {
  print('123'.toInt());
  print('123.45'.toDouble());
  print('2021-09-01'.toDate());
  print('true'.toBool());
  print('1,2,3'.toList());
  print('assets/images/pet_a.png'.toImage());
  print(1630454400000.toYMD());
  print(1630454400000.toYmdHms());
}
