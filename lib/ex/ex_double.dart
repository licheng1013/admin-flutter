extension ExDouble  on double {
  // 只保留小数点后两位
  double to2() {
    return double.parse(toStringAsFixed(2));
  }

  // 保留小数点后4位
  double to4() {
    return double.parse(toStringAsFixed(4));
  }
}