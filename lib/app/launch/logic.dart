import 'package:admin_flutter/app/home/view.dart';
import 'package:admin_flutter/app/login/view.dart';
import 'package:admin_flutter/common/app_data.dart';
import 'package:get/get.dart';


class LaunchLogic extends GetxController {

  @override
  void onInit() async {
    super.onInit();
    // 休眠3秒
    await Future.delayed(const Duration(seconds: 1));
    var data = await AppData.read();
    if (data.token.isEmpty) {
      Get.off(() => LoginPage());
    }else{
      Get.off(() => HomePage());
    }
  }
}
