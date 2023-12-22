import 'package:app_template/app/home/view.dart';
import 'package:app_template/app/login/view.dart';
import 'package:app_template/common/app_data.dart';
import 'package:get/get.dart';

import 'state.dart';

class LaunchLogic extends GetxController {
  final LaunchState state = LaunchState();

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
