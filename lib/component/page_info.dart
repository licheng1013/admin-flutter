import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// 封装了一个无限滚动组件
class PageInfo<T> {
  static int page = 1;
  final int pageSize;
  PagingController<int, T> pagingController =
      PagingController(firstPageKey: page);

  PageInfo({this.pageSize = 10});

  Future<List<T>> Function(int page, int size) findFun =
      (page, size) => Future.value(<T>[]);

  var isLoadListener = false;

  Future<void> init(Future<List<T>> Function(int page, int size) find) async {
    findFun = find;
    if (isLoadListener) {
      return;
    }
    pagingController.addPageRequestListener((pageKey) {
      list(pageKey);
    });
    isLoadListener = true;
  }

  void list(int page) async {
    print("页数:$page");
    try {
      var data = await findFun.call(page, pageSize);
      //MyLog.log("数据:$data");
      final isLastPage = data.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(data);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(data, nextPageKey);
      }
    } catch (error) {
      debugPrint("错误:$error");
      pagingController.error = error;
    }
  }

  Widget build(Widget Function(T item, int index) fun) {
    return PagedListView<int, T>(
        padding: EdgeInsets.zero,
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<T>(
            noItemsFoundIndicatorBuilder: (context) => noItems(),
            firstPageErrorIndicatorBuilder: (context) => firstPage(),
            newPageErrorIndicatorBuilder: (context) => newPageError(),
            noMoreItemsIndicatorBuilder: (context) => noMoreItems(),
            itemBuilder: (context, item, index) {
              return fun(item, index);
            }));
  }

  delete(int index) {
    pagingController.itemList?.removeAt(index);
    pagingController.appendPage(<T>[], pagingController.nextPageKey);
  }

  static Widget noItems() {
    return const Center(child: Text("暂无数据", style: TextStyle(fontSize: 18)));
  }

  static Widget firstPage() {
    return const Center(child: CupertinoActivityIndicator());
  }

  static Widget newPageError() {
    return const Center(child: Text("加载失败，点击重试"));
  }

  void insert(int index, T item) {
    pagingController.itemList?.insert(index, item);
    pagingController.appendPage(<T>[], pagingController.nextPageKey);
  }

  static Widget noMoreItems() {
    return const Center(child: Text("没有更多数据了..."));
  }

  Widget buildGrid(
      Widget Function(T item, int index) fun, SliverGridDelegate gridDelegate,
      {ScrollController? controller}) {
    return PagedGridView<int, T>(
      scrollController: controller,
      padding: EdgeInsets.zero,
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<T>(
          noItemsFoundIndicatorBuilder: (context) => noItems(),
          firstPageErrorIndicatorBuilder: (context) => firstPage(),
          newPageErrorIndicatorBuilder: (context) => newPageError(),
          noMoreItemsIndicatorBuilder: (context) => noMoreItems(),
          itemBuilder: (context, item, index) {
            return fun(item, index);
          }),
      gridDelegate: gridDelegate,
    );
  }
}
