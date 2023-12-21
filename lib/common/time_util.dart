import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeUtil {
  static Future<DateTime?> showTime() async {
    // 获取今年开始时间
    DateTime a = DateTime.timestamp();
    // 获取今年结束时间
    DateTime b = DateTime.timestamp();
    b = b.add(365.days);
    var time = await showDatePicker(
        context: Get.context!, firstDate: a, lastDate: b, initialDate: a);
    return time;
  }
}
