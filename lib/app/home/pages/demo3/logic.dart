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
    UiEdit.confirm(submit: () {
      pagingController.itemList?.removeAt(index);
      dbList.removeAt(index);
      pagingController.refresh();
      "删除成功!".toHint();
    }, content: const Text("正在进行删除操作！"));
  }

  void add(int index) {
    pagingController.itemList?.insert(index, "${dbList.length}");
    dbList.insert(index, "${dbList.length}");
    pagingController.refresh();
  }
}
