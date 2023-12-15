import 'package:app_template/common/http_util.dart';
import 'package:app_template/common/message_util.dart';

class AdminApi {

  static Future<dynamic> adminList({Map<String, dynamic>? params}) async {
    return await HttpUtil.get("/admin/list", params: params);
  }

  static Future<dynamic> adminLogin({Map<String, dynamic>? params}) async {
    return await HttpUtil.post("/admin/login", params: params);
  }



}
