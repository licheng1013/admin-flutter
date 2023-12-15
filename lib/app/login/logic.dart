import 'package:app_template/app/home/view.dart';
import 'package:app_template/common/app_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  var accountText = TextEditingController();
  var passwordText = TextEditingController();
  void login() async {
    AppData.easySave((p0) => {
      p0.token = "login",
      Get.offAll(()=>HomePage())
    });
  }
}
