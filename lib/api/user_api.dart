import 'package:admin_flutter/common/http_util.dart';

class UserApi {

  static Future<dynamic> userList({Map<String, dynamic>? params}) async {
    return await HttpUtil.get("/user/list", params: params);
  }

  static Future<dynamic> userInsert({Map<String, dynamic>? params}) async {
    return await HttpUtil.post("/user/insert", params: params);
  }

  static Future<dynamic> userDelete({Map<String, dynamic>? params}) async {
    return await HttpUtil.post("/user/delete", params: params);
  }

  static Future<dynamic> userUpdate({Map<String, dynamic>? params}) async {
    return await HttpUtil.post("/user/update", params: params);
  }
}
