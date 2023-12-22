import 'package:get/get.dart';

import 'state.dart';

class AdminLogic extends GetxController {
  final AdminState state = AdminState();

  var list = <Map<String, dynamic>>[].obs;
  var total = 200;

  Map<String, dynamic> _data(int i) {
    return {
      "id": "张三$i",
      "userName": "张三$i",
      "password": "张三$i",
      "salt": "张三$i",
      "createTime": "张三$i",
      "nickName": "张三$i",
    };
  }

  void find(size, page) {
    list.clear();
    if (page * size > total) {
      // TODO 这里暂时还有个问题， 当前页的数据不足一页时，会出现空白
      return;
    }
    for (int i = (page - 1) * size; i < page * size; i++) {
      list.add(_data(i));
    }
    list.refresh();
  }
}
