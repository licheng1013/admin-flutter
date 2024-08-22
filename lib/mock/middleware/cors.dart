
import 'dart:io';

bool cors(HttpRequest request){
  // 设置 CORS 头部
  request.response.headers.set('Access-Control-Allow-Origin', '*');
  request.response.headers.set('Access-Control-Allow-Methods', '*');
  request.response.headers.set('Access-Control-Allow-Headers', 'Content-Type,Authorization');
  if (request.method == 'OPTIONS') {
    // 对于预检请求，直接返回 200 OK
    request.response.statusCode = HttpStatus.ok;
    request.response.close();
    return true;
  }
  return false;
}