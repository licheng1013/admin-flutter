import 'package:admin_flutter/component/ui_edit.dart';
import 'package:admin_flutter/ex/ex_hint.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Demo3Logic extends GetxController {
  static const pageSize = 20;

  final PagingController<int, String> pagingController =
      PagingController(firstPageKey: 0);

  var dbList = <String>[].obs;

  var scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    for (var i = 0; i < 100; i++) {
      dbList.add("$i");
    }
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems = dbList.skip(pageKey * pageSize).take(pageSize).toList();
      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
      //print("${pagingController.itemList?.length}");
    } catch (error) {
      pagingController.error = error;
    }
  }

  delete(int index) {
    pagingController.itemList?.removeAt(index);
    dbList.removeAt(index);
    pagingController.appendPage(<String>[], pagingController.nextPageKey);
    "删除成功!".toHint();
  }

  void add(int index) {
    var item = "插入 ${dbList.length}";
    pagingController.itemList?.insert(index, item);
    dbList.insert(index, item);
    pagingController.appendPage(<String>[], pagingController.nextPageKey);
    "插入成功!".toHint();
  }
}
