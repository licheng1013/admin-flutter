import 'package:flutter/widgets.dart';

extension ExMap<T,V> on Map {
  /// 遍历元素，返回一个新的List
  List<Widget> toWidgets(Widget Function(T key) item) {
    return keys.map((e) => item(e)).toList();
  }

  /// 获取key对应的值，如果没有则返回默认值
  V toGetOrDefault(T key, V defaultValue) {
    return containsKey(key) ? this[key] : defaultValue;
  }
}