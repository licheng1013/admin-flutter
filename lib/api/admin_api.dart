import 'package:app_template/common/http_util.dart';

class AdminApi {

  static Future<dynamic> adminList({Map<String, dynamic>? params}) async {
    return await HttpUtil.get("/admin/list", params: params);
  }

  static Future<dynamic> adminLogin({Map<String, dynamic>? params}) async {
    return await HttpUtil.post("/admin/login", params: params);
  }

  static Future<dynamic> adminInsert({Map<String, dynamic>? params}) async {
    return await HttpUtil.post("/admin/insert", params: params);
  }

  static Future<dynamic> adminDelete({Map<String, dynamic>? params}) async {
    return await HttpUtil.post("/admin/delete", params: params);
  }
}
