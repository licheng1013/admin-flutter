import 'package:app_template/common/message_util.dart';
import 'package:app_template/common/time_util.dart';
import 'package:app_template/component/form/form_data.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FormPage extends StatelessWidget {
  final Function()? back;
  final Function(Map<String, dynamic>)? submit;

  FormPage({Key? key, this.back, this.submit}) : super(key: key);

  final logic = Get.put(FormLogic());
  final state = Get.find<FormLogic>().state;

  @override
  Widget build(BuildContext context) {
    var form = FormDto(labelWidth: 80, columns: [
      FormColumnDto(label: "账号", key: "username"),
      FormColumnDto(
          placeholder: "请输入密码",
          label: "密码",
          key: "password",
          type: FormColumnEnum.password),
      FormColumnDto(
          placeholder: "请输入手机号",
          label: "手机号",
          key: "tel",
          type: FormColumnEnum.number,
          maxLength: 11),
      FormColumnDto(label: "地址", key: "address", placeholder: "请输入地址"),
      FormColumnDto(label: "金币", key: "number", type: FormColumnEnum.float),
      FormColumnDto(
          label: "创建时间", key: "createTime", type: FormColumnEnum.datetime),
    ]);

    return Column(
      children: [
        ThemeUtil.rowHeight(),
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                "添加表单",
                style: TextStyle(fontSize: 24),
              ),
            )),
        ThemeUtil.rowHeight(),
        for (var column in form.columns) _column(form, column),
        ThemeUtil.rowHeight(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const Spacer(),
              OutlinedButton(
                  onPressed: () {
                    back?.call();
                  },
                  child: const Text(
                    "返回",
                    style: TextStyle(color: Colors.black),
                  )),
              ThemeUtil.rowWidth(),
              FilledButton(
                  onPressed: () {
                    submit?.call(form.data);
                  },
                  child: const Text("提交")),
            ],
          ),
        ),
        ThemeUtil.rowHeight()
      ],
    );
  }

  bool _isTimeType(FormColumnEnum type) {
    return type == FormColumnEnum.date ||
        type == FormColumnEnum.datetime ||
        type == FormColumnEnum.time;
  }

  Widget _column(FormDto form, FormColumnDto column) {
    var text = TextEditingController(text: form.data[column.key]);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
              width: form.labelWidth,
              child: column.labelRender == null
                  ? Align(
                      alignment: form.labelAlignment,
                      child: Text(
                        column.label,
                        style: const TextStyle(fontSize: 16),
                      ))
                  : column.labelRender!(form, column.key)),
          column.render == null
              ? Expanded(
                  child: SizedBox(
                  child: TextField(
                    controller: text,
                    onChanged: (value) {
                      form.data[column.key] = value;
                    },
                    readOnly: _isTimeType(column.type),
                    maxLength: column.maxLength,
                    // 密码隐藏
                    obscureText: column.type == FormColumnEnum.password,
                    decoration: InputDecoration(
                      counterText: "", //关闭输入长度提示
                      hintText: column.placeholder,
                      suffixIcon: _isTimeType(column.type)
                          ? IconButton(
                              onPressed: () async {
                                // 打开时间选择器
                                var time = await TimeUtil.showTime();
                                if (time != null) {
                                  MessageUtil.show(time.toString());
                                  form.data[column.key] = time.toString();
                                  text.text = time.toString();
                                }
                              },
                              icon: const Icon(Icons.date_range),
                            )
                          : null,
                    ),
                    // 限制输入字符串
                    inputFormatters: FormColumnEnum.rule[column.type] == null
                        ? null
                        : [
                            FilteringTextInputFormatter.allow(
                                RegExp(FormColumnEnum.rule[column.type]!))
                          ],
                  ),
                ))
              : Expanded(child: column.render!(form, column.key))
        ],
      ),
    );
  }
}
