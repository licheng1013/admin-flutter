import 'package:app_template/common/assets_util.dart';
import 'package:app_template/common/http_util.dart';
import 'package:app_template/common/message_util.dart';
import 'package:get/get.dart';

import 'state.dart';

class UploadLogic extends GetxController {
  final UploadState state = UploadState();

  var imageList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < 10; i++) {
      imageList.add(AssetsUtil.bgImage);
    }
  }

  void selectFile() async {
    var list = await AssetsUtil.selectFile();
    var bySum = 0;
    if (list.isNotEmpty) {
      for (var el in list) {
        imageList.add(el.path);
        var byList = await el.readAsBytes();
        bySum += byList.length;
      }
    }
    MessageUtil.show("总大小：${bySum / 1024 ~/ 1024}M");
  }

  static Future<dynamic> fileUpload({Map<String, dynamic>? params}) async {
    return await HttpUtil.post("/file/upload", params: params);
  }
}
