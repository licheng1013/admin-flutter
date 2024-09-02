import 'package:admin_flutter/common/time_util.dart';
import 'package:admin_flutter/component/form/form_data.dart';
import 'package:admin_flutter/ex/ex_btn.dart';
import 'package:admin_flutter/ex/ex_hint.dart';
import 'package:admin_flutter/ex/ex_list.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'enum.dart';
import 'logic.dart';

class FormPage extends StatelessWidget {
  final Function()? back;
  final Function(Map<String, dynamic>)? submit;
  final FormDto form;

  FormPage(this.form, {Key? key, this.back, this.submit}) : super(key: key);

  final logic = Get.put(FormLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ThemeUtil.height(),
         Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                form.title,
                style: const TextStyle(fontSize: 24),
              ),
            )),
        ThemeUtil.height(),
        ...form.columns.toWidgets((e)=>_column(form, e)),
        ThemeUtil.height(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const Spacer(),
              "返回".toOutlineBtn(onTap: (){
                back?.call();
              }),
              ThemeUtil.width(),
              "提交".toBtn(onTap: (){
                    submit?.call(form.data);
              })
            ],
          ),
        ),
        ThemeUtil.height()
      ],
    );
  }

  bool _isTimeType(FormColumnEnum type) {
    return type == FormColumnEnum.date ||
        type == FormColumnEnum.datetime ||
        type == FormColumnEnum.time;
  }

  Widget _column(FormDto form, FormColumnDto column) {
    var text = TextEditingController(text: (form.data[column.key] ?? "").toString());
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
                                  time.toString().toHint();
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
