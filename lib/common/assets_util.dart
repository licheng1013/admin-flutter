import 'dart:io';

import 'package:admin_flutter/common/image_util.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetsUtil {


  static XTypeGroup image() {
    return const XTypeGroup(
      label: 'Images',
      extensions: <String>['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'heif'],
    );
  }



  static void showImage(String path) {
    MultiImageProvider multiImageProvider =
        MultiImageProvider([ImageUtil.imageProviderByPath(path)]);
    showImageViewerPager(Get.context!, multiImageProvider,
        immersive: false,
        backgroundColor: Colors.white,
        closeButtonTooltip: "关闭",
        closeButtonColor: Colors.black,
        swipeDismissible: true,
        doubleTapZoomable: true, onPageChanged: (page) {
      print("page changed to $page");
    }, onViewerDismissed: (page) {
      print("dismissed while on page $page");
    });
  }
}
