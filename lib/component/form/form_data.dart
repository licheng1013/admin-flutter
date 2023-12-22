import 'package:app_template/component/form/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDto {
  /// 字段列表
  final List<FormColumnDto> columns;

  /// 标签宽度
  final double labelWidth;

  /// 标签对齐方式
  final Alignment labelAlignment;

  /// 字段数据
  Map<String, dynamic> data = {};

  FormDto(
      {required this.columns,
      this.labelWidth = 55,
      this.labelAlignment = Alignment.centerLeft});
}

class FormColumnDto {
  /// 标签
  final String label;

  /// 字段
  final String key;

  /// 渲染函数
  final Widget Function(FormDto, String)? render;

  /// 标签渲染函数
  final Widget Function(FormDto, String)? labelRender;

  /// 限制输入类型
  final FormColumnEnum type;

  /// 限制长度
  final int? maxLength;

  /// 占位文字
  final String? placeholder;

  FormColumnDto({required this.label,
    required this.key,
    this.render,
    this.labelRender,
    this.type = FormColumnEnum.text,
    this.placeholder,
    this.maxLength});
}

/// 限制输入类型
enum FormColumnEnum {
  text,
  number,
  float,
  password,
  email,
  date,
  time,
  datetime,
  chinese;

  static Map<FormColumnEnum, String> rule = {
    FormColumnEnum.number: "[0-9]",
    FormColumnEnum.float: "[0-9.]",
  };
}

void requestForm(FormDto form, {Function(Map<String, dynamic>)? submit}) {
  // 打开全屏窗口
  Get.dialog(Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Card(
        child: SizedBox(
            width: 600,
            child: FormPage(
              form,
              back: () {
                Get.back();
              },
              submit: (data) {
                submit?.call(data);
              },
            )),
      ),
      const SizedBox(
        height: 100,
      ),
    ],
  ));
}