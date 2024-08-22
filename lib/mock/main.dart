import 'dart:io';

import 'package:admin_flutter/mock/middleware/cors.dart';
import 'package:admin_flutter/mock/user_api.dart';

void main() async {
  var userApi = UserApi();
  var routerMap = <String, Function(HttpRequest)>{
    '/user/list': userApi.list,
    '/user/update': userApi.update,
    '/user/insert': userApi.insert,
    '/user/delete': userApi.delete,
  };
  WebServer.startServer(8080, routerMap);
}

class WebServer {
  static void startServer(int port, Map routerMap) async {
    // 创建一个HTTP服务器
    var server = await HttpServer.bind(InternetAddress.anyIPv4, port);
    print('http://localhost:${server.port}');
    // 监听请求
    await for (var request in server) {
      if(cors(request)) {
        continue;
      }
      // 根据请求的URI路径分发到不同的处理器
      final path = request.uri.path;
      //print("path:$path");
      if (routerMap.containsKey(path)) {
        routerMap[path]!(request);
      } else {
        handleNotFound(request);
      }
    }
  }
}

void handleNotFound(HttpRequest request) async {
  request.response
    ..statusCode = HttpStatus.notFound
    ..write('404: Not Found');
  await request.response.close();
}

void warpResult(HttpRequest request, dynamic data) async {
  request.response
    ..statusCode = HttpStatus.ok
    ..headers.contentType = ContentType.json
    ..write(data);
  await request.response.close();
}
