import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:admin_flutter/mock/result.dart';
import 'package:admin_flutter/mock/user.dart';

import 'main.dart';

class UserApi {
  var db = <User>[];

  UserApi() {
    for (var i = 1; i < 100; i++) {
      // 随机字符粗
      var nickName = List.generate(
          4, (index) => String.fromCharCode(Random().nextInt(26) + 65)).join();
      // 随机盐
      var salt = List.generate(
          8, (index) => String.fromCharCode(Random().nextInt(26) + 65)).join();
      // 随机密码
      var password = List.generate(
          6, (index) => String.fromCharCode(Random().nextInt(26) + 65)).join();
      db.add(User(
          id: i,
          userName: "用户$i",
          password: password,
          salt: salt,
          nickName: nickName,
          createTime: DateTime.now().toIso8601String()));
    }
  }

  void list(HttpRequest request) async {
    // 获取分页参数
    var size = int.parse(request.uri.queryParameters["size"] ?? "10");
    var page = int.parse(request.uri.queryParameters["page"] ?? "1");
    // 计算分页数据
    var start = (page - 1) * size;
    var end = min(page * size, db.length);
    warpResult(request,Result.okData({"total": db.length, "list": db.sublist(start, end)}));
  }

  void update(HttpRequest request) async {
    var content = await utf8.decoder.bind(request).join();
    var data = jsonDecode(content) as Map<String, dynamic>;
    var id = int.tryParse(data["id"].toString()) ?? 0;
    var index = db.indexWhere((element) => element.id == id);
    if (index == -1) {
      warpResult(request,Result.fail("id不存在"));
      return;
    }
    var user = User.fromJson(data);
    db[index] = user;
    warpResult(request,Result.ok());
  }

  void insert(HttpRequest request) async {
    var content = await utf8.decoder.bind(request).join();
    var data = jsonDecode(content) as Map<String, dynamic>;
    var user = User.fromJson(data);
    user.id = db.last.id ++;
    db.insert(0,user);
    warpResult(request,Result.ok());
  }

  void delete(HttpRequest request) async {
    // 获取请求体的json
    var content = await utf8.decoder.bind(request).join();
    var data = jsonDecode(content) as Map<String, dynamic>;
    var id = int.tryParse(data["id"].toString()) ?? 0;
    if (id == 0) {
      warpResult(request,Result.fail("id为空"));
      return;
    }
    db.removeWhere((element) => element.id == id);
    warpResult(request,Result.ok());
  }
}
