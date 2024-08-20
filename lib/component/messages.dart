import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  var map = <String, Map<String, String>>{};

  Future<void> init() async {
    await load("zh_CN", "assets/messages/cn.json");
    await load("en_US", "assets/messages/en.json");
  }

  Future<void> load(String name, String path) async {
    await rootBundle.loadString(path).then((lang) {
      var mapLang = jsonDecode(lang);
      var m = <String, String>{};
      mapLang.forEach((key, value) {
        m[key] = value;
      });
      keys[name] = m;
    });
  }

  @override
  Map<String, Map<String, String>> get keys => map;
}
