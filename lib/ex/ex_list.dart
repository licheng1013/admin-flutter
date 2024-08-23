import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/cupertino.dart';

extension ExList<T> on List<T> {
  /// 遍历元素，返回一个新的List
  List<Widget> toWidgetsWithIndex(Widget Function(T, int) item) {
    return map((e) => item(e, indexOf(e))).toList();
  }

  /// 遍历元素，返回一个新的List
  List<Widget> toWidgets(Widget Function(T) item) {
    return map((e) => item(e)).toList();
  }

  /// 添加一个元素，如果已经存在则删除，否则添加
  void addOrRemove(T item) {
    if (contains(item)) {
      remove(item);
    } else {
      add(item);
    }
  }

  /// 将动态列表转换为Map列表
  List<Map<String, dynamic>> toListMap() {
    var result = <Map<String, dynamic>>[];
    for (var element in this) {
      result.add(element as Map<String, dynamic>);
    }
    return result;
  }
}

extension ExListColor<TextColor> on List {
  /// List<TextColor> 时才可用
  Widget toColorText() {
    return Text.rich(
      style: TextStyle(color: UiTheme.onBackground()),
      TextSpan(
        children:
            map((e) => TextSpan(text: e.text, style: TextStyle(color: e.color)))
                .toList(),
      ),
    );
  }
}

extension ExStringColor on String {
  TextColor inColor({Color? color}) {
    return TextColor(this, color: color);
  }
}

class TextColor {
  Color? color;
  String text = "";

  TextColor(this.text, {this.color});
}
