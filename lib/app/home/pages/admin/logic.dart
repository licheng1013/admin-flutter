import 'package:app_template/api/admin_api.dart';
import 'package:app_template/component/table/table_data.dart';
import 'package:get/get.dart';

import 'state.dart';

class AdminLogic extends GetxController {
  final AdminState state = AdminState();

  var list = <Map<String, dynamic>>[].obs;
  var total = 0.obs;

  var loading = false.obs;

  void find(size, page) {
    list.clear();
    loading.value = true;
    AdminApi.adminList(params: {
      "size": size,
      "page": page,
    }).then((value) async {
      total.value = value["total"];
      list.addAll(TableData.listDyToMap(value["list"]));
      list.refresh();
      // 休眠 300 毫米
      await Future.delayed(const Duration(milliseconds: 300));
      loading.value = false;
    });
  }
}
