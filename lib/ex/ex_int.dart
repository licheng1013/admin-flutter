import 'dart:async';

extension ExInt on int {
  /// 转换为年月日格式,单位为微秒
  String toYMD() {
    return DateTime.fromMicrosecondsSinceEpoch(this)
        .toString()
        .substring(0, 10);
  }

  /// 转换为年月日时分秒格式， 单位为毫秒
  String toYmdHms() {
    return DateTime.fromMillisecondsSinceEpoch(this)
        .toString()
        .substring(0, 19);
  }

  /// 延迟执行，单位毫秒
  void toDelay(Function() f) {
    Future.delayed(Duration(milliseconds: this), f);
  }

  /// eq
  bool toEq(int other) {
    return this == other;
  }


  /// 创建一个循环执行的定时器
  Timer toTimer(Function(Timer timer) f) {
    return Timer.periodic(Duration(milliseconds: this), f);
  }
}