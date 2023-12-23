import 'dart:io';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetsUtil {
  static String bgImage = "assets/images/image.png";

  static XTypeGroup image() {
    return const XTypeGroup(
      label: 'Images',
      extensions: <String>['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'heif'],
    );
  }

  static Future<List<XFile>> selectFile({XTypeGroup? type}) async {
    if (type == null) {
      return await openFiles(acceptedTypeGroups: <XTypeGroup>[]);
    }
    return await openFiles(acceptedTypeGroups: <XTypeGroup>[type]);
  }

  static Image imageByPath(String path, {final BoxFit? fit}) {
    return Image(
      image: imageProviderByPath(path),
      fit: fit,
    );
  }

  static ImageProvider imageProviderByPath(String path) {
    if (path.startsWith("https://") ||
        path.startsWith("http://") ||
        path.startsWith("blob:")) {
      return NetworkImage(path);
    }
    if (path.startsWith("assets/")) {
      return AssetImage(path);
    }
    return FileImage(File(path));
  }

  static void showImage(String path) {
    MultiImageProvider multiImageProvider =
        MultiImageProvider([imageProviderByPath(path)]);
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
