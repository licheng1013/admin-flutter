import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  String token = "";
  String themeName = "";

  // toJson
  String toJson() {
    return jsonEncode({
      "token": token,
      "themeName": themeName,
    });
  }

  // fromJson
  static AppData fromJson(Map<String, dynamic> map) {
    var data = AppData();
    data.token = map["token"] ?? "";
    data.themeName = map["themeName"] ?? "";
    return data;
  }

  static String saveKey = "app_data";

  static Future<AppData> read() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(saveKey);
    if (data == null) {
      return AppData();
    }
    return AppData.fromJson(jsonDecode(data));
  }

  // 保存数据
  Future<void> save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(saveKey, toJson());
  }

  /// 更简单的数据保存
  static Future<void> easySave(Function(AppData) dg) async {
    var data = await read();
    dg(data);
    await data.save();
  }
}
