import 'package:admin_flutter/component/page_info.dart';
import 'package:admin_flutter/component/ui_edit.dart';
import 'package:admin_flutter/ex/ex_hint.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Demo3Logic extends GetxController {

  var dbList = <String>[].obs;
  var myPage = PageInfo<String>();
  var scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    for (var i = 0; i < 100; i++) {
      dbList.add("$i");
    }
    myPage.init((page,size){
      final newItems = dbList.skip((page-1) * size).take(size).toList();
      return Future.value(newItems);
    });
  }



  delete(int index) {
    myPage.delete(index);
    dbList.removeAt(index);
    "删除成功!".toHint();
  }

  void add(int index) {
    var item = "插入 ${dbList.length}";
    myPage.insert(index,item);
    dbList.insert(index, item);
    "插入成功!".toHint();
  }
}
