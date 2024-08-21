import 'package:app_template/common/message_util.dart';
import 'package:get/get.dart';


class PaginationLogic extends GetxController {
  var size = 10.obs;
  var current = 1.obs;
  var totalPage = 0.obs;
  int total = 0;
  Function(int size, int page) changed  = (size, page) {};
  void prev() {
    if (current.value == 1) {
      MessageUtil.show("已经是第一页了");
      return;
    }
    current.value--;
    reload();
  }

  void next() {
    if (current.value == totalPage.value) {
      MessageUtil.show("已经是最后一页了");
      return;
    }
     current.value++;
    reload();
  }


  void reload() {
    totalPage.value =
        total ~/ size.value + (total % size.value != 0 ? 1 : 0);
    changed(size.value, current.value);
  }
}
