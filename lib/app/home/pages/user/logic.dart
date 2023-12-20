import 'package:get/get.dart';

import 'state.dart';

class UserLogic extends GetxController {
  final UserState state = UserState();

  var list = <Map<String, dynamic>>[].obs;
  var total = 200;

  Map<String, dynamic> _data(int i) {
    return {
      "name": "张三$i",
      "age": "张三$i",
      "sex": "张三$i",
      "tel": "张三$i",
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
