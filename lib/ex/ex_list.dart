import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/cupertino.dart';

extension ExList<T> on List<T> {
  List<Widget> toWidgetsWithIndex(Widget Function(T, int) item) {
    return map((e) => item(e, indexOf(e))).toList();
  }

  List<Widget> toWidgets(Widget Function(T) item) {
    return map((e) => item(e)).toList();
  }
}


extension ExListColor<TextColor> on List{
  /// List<TextColor> 时才可用
  Widget toColorText() {
    return Text.rich(
      style: TextStyle(color: UiTheme.onBackground()),
      TextSpan(
        children: map((e) => TextSpan(text: e.text, style: TextStyle(color: e.color))).toList(),
      ),
    );
  }
}

extension ExStringColor on String{
  TextColor inColor({Color? color}){
    return TextColor(this,color: color);
  }
}



class TextColor {
  Color? color;
  String text = "";
  TextColor(this.text,{this.color});
}