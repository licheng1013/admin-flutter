import 'package:flutter/widgets.dart';

class AnimateUtil{
  // 宽度缩放动画
  static Widget widthScaleAnimation(Widget widget, double width,bool isExpanded,{Function()? onEnd}){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isExpanded ? width : 0,
      // 动画完成事件
      onEnd: onEnd,
      child: widget,
    );
  }
}