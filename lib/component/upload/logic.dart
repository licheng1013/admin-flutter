import 'dart:typed_data';

import 'package:app_template/common/assets_util.dart';
import 'package:app_template/common/http_util.dart';
import 'package:app_template/common/message_util.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class UploadLogic extends GetxController {

  var imageList = <String>[].obs;
  var testMode = true;
  XTypeGroup? type;
  bool multiple = false;
  int limit = 1;

  void selectFile() async {
    var list = await AssetsUtil.selectFile(type: type);
    var bySum = 0;
    if (list.isNotEmpty) {
      for (var el in list) {
        if (imageList.length >= limit) {
          MessageUtil.show("超过最大上传数量");
          break;
        }
        var byList = await el.readAsBytes();
        bySum += byList.length;
        // 测试模式可以不上传预览
        if (testMode) {
          imageList.add(el.path);
        } else {
          var fileUrl = await fileUpload(byList, el.name);
          imageList.add(fileUrl);
        }
      }
    }
    debugPrint("总大小:${bySum / 1024 / 1024}M");
  }

  static Future<dynamic> fileUpload(Uint8List fromBytes, String name) async {
    return await HttpUtil.upload("/file/upload", fromBytes, name);
  }
}
