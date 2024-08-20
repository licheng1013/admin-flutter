import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// 动画扩展
extension ExAnim on Widget {
  /// 放大动画
  Widget toScale(bool enable,{Offset scale = const Offset(1.2, 1.2)}) {
    if(enable){
      return animate().scale(end: scale);
    }
    return this;
  }

  Widget toJump(bool enable) {
    if(enable){
      return animate().shake();
    }
    return this;
  }

}