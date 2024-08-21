import 'dart:convert';

class Result {
  int code = 0;
  String msg = "ok";
  dynamic data = {};
  Result();
  static Result okData(dynamic data) {
    var result = Result();
    result.data = data;
    return result;
  }

  static Result ok() {
    return Result();
  }

  static Result fail(String msg) {
    var result = Result();
    result.code = -1;
    result.msg = msg;
    return result;
  }

  // 序列化和反序列化
  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "msg": msg,
      "data": data
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory Result.fromJson(Map<String, dynamic> json) {
     var result = Result();
      result.code = json["code"];
      result.msg = json["msg"];
      result.data = json["data"];
      return result;
  }
}
