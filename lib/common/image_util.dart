import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtil {
  static Future<String> select() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.path;
    }
    return "";
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

  /// 全局图片处理器
  static Widget image(String obj) {
    return Image(
      image: imageProviderByPath(obj),
      fit: BoxFit.fill,
      width: double.infinity,
      // 失败回调
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey,
          child: const Center(
            child: Text("加载失败",style: TextStyle(fontSize: 8),),
          ),
        );
      },
    );
  }
}
