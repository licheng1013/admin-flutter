import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// 动画扩展
extension ExAnim on Widget {
  /// 放大动画
  Widget toScale(bool enable, {Offset scale = const Offset(1.2, 1.2)}) {
    if (enable) {
      return animate().scale(end: scale);
    }
    return this;
  }

  /// 晃动动画
  Widget toJump(bool enable, {double offset = 1}) {
    if (enable) {
      return animate().shake(offset: Offset(offset, 0));
    }
    return this;
  }

  /// 旋转动画
  Widget toRotate(bool enable, {double angle = 0.5}) {
    if (enable) {
      return animate().rotate(end: angle);
    }
    return this;
  }

  /// 水平加淡出动画
  Widget toFadeIn(bool enable) {
    if (enable) {
      return animate().fadeIn();
    }
    return this;
  }

  /// 淡出动画
  Widget toFadeInWithMoveX(bool enable) {
    if (enable) {
      return animate().fadeIn().moveX();
    }
    return this;
  }

  /// 手风琴动画从上往下
  Widget toAccordion(bool enable) {
    if (enable) {
      return animate().custom(
        builder: (context, value, child) {
          return ClipRect(
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: value,
              child: child,
            ),
          );
        },
      );
    }
    return this;
  }

  /// 展开，收缩动画
  Widget toAccordionX(bool enable, {double width = 230, Function()? onEnd}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: enable ? width : 0,
      onEnd: onEnd,
      child: this,
    );
  }

}
