import 'package:flutter/material.dart';

/// 扩展按钮
extension ExBtn on String {

  /// 按钮
  Widget toBtn({required Function() onTap,Color? color,Color? textColor}) {
    return FilledButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color),
      ), child: Text(this,style: TextStyle(color: textColor)),
    );
  }

  /// 无边框按钮
  Widget toOutlineBtn({required Function() onTap}) {
    return OutlinedButton(onPressed: onTap, child: Text(this));
  }
}