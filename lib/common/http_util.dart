import 'dart:typed_data';

import 'package:app_template/common/app_data.dart';
import 'package:app_template/common/message_util.dart';
import 'package:dio/dio.dart';

class HttpUtil {
  static const String baseUrl = "http://192.168.101.100:9999";
  static const authorization = "Authorization";

  static final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  static Future<dynamic> get(String url,
      {Map<String, dynamic>? params, bool showMsg = true}) async {
    var map = await header();
    Response response = await dio.get(url,
        queryParameters: params, options: Options(headers: map));
    return verify(response.data, showMsg);
  }

  static Future<dynamic> post(String url,
      {Map<String, dynamic>? params, bool showMsg = true}) async {
    var map = await header();
    Response response = await dio.post(url,
        data: params,
        options: Options(contentType: Headers.jsonContentType, headers: map));
    return verify(response.data, showMsg);
  }

  /// 全局请求头
  static Future<Map<String, dynamic>> header() async {
    var data = await AppData.read();
    return {authorization: data.token};
  }

  /// 上传文件处理
  static Future<dynamic> upload(String url, Uint8List file, String name,
      {bool showMsg = true}) async {
    var map = await header();
    var formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(file, filename: name),
    });
    Response response =
        await dio.post(url, data: formData, options: Options(headers: map));
    return verify(response.data, showMsg);
  }

  /// 验证结果
  static dynamic verify(dynamic data, bool showMsg) {
    if (data["code"] == 0) {
      return data["data"];
    } else {
      if (showMsg) {
        MessageUtil.show(data["msg"]);
      }
      throw Exception(data["msg"]);
    }
  }
}
