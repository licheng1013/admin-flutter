import 'dart:io';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetsUtil {
  static String bgImage = "assets/images/image.png";

  static Future<List<XFile>> selectFile() async {
    const XTypeGroup jpgsTypeGroup = XTypeGroup(
      label: 'JPEGs',
      extensions: <String>['jpg', 'jpeg'],
    );
    const XTypeGroup pngTypeGroup = XTypeGroup(
      label: 'PNGs',
      extensions: <String>['png'],
    );
    final List<XFile> files = await openFiles(acceptedTypeGroups: <XTypeGroup>[
      jpgsTypeGroup,
      pngTypeGroup,
    ]);
    return files;
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
