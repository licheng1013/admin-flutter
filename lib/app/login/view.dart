import 'package:admin_flutter/theme/theme_util.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final logic = Get.put(LoginLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Admin Flutter',
                style: TextStyle(fontSize: 32),
              ),
              ThemeUtil.height(height: 18),
              textInput(logic.accountText,
                  hintText: '请输入账号', labelText: '账号'),
              ThemeUtil.height(),
              textInput(logic.passwordText,
                  hintText: '请输入密码', labelText: '密码', password: true),
              ThemeUtil.height(),
              InkWell(
                onTap: () {
                  logic.login();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: ThemeUtil.boxDecoration(
                      color: UiTheme.primary()),
                  child:  Center(
                      child: Text(
                    '登入',
                    style: TextStyle(color: UiTheme.onPrimary(), fontSize: 16),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 增加文字输入框
  Widget textInput(TextEditingController text,
      {String? hintText, String? labelText, bool password = false}) {
    return TextField(
      controller: text,
      obscureText: password,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        // 占位符
        hintText: hintText,
        // 激活时的边框样式
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: UiTheme.primary(),
          ),
        ),
      ),
    );
  }
}
