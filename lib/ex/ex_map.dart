import 'package:flutter/widgets.dart';

extension ExMap<T> on Map<T,T> {
  /// 遍历元素，返回一个新的List
  List<Widget> toWidgets(Widget Function(T key) item) {
    return keys.map((e) => item(e)).toList();
  }
}