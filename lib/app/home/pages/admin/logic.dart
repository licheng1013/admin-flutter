import 'package:app_template/api/admin_api.dart';
import 'package:app_template/common/message_util.dart';
import 'package:app_template/component/form/form_data.dart';
import 'package:app_template/component/table/table_data.dart';
import 'package:app_template/component/ui_edit.dart';
import 'package:get/get.dart';

import 'state.dart';

class AdminLogic extends GetxController {
  final AdminState state = AdminState();

  var list = <Map<String, dynamic>>[].obs;
  var total = 0.obs;
  var size = 0;
  var page = 0;
  var loading = false.obs;

  void find(size, page) {
    this.size = size;
    this.page = page;
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

  var columns = [
    // TableData.multipleSelect(
    //     selectList: (e) => {MessageUtil.show("选择了: ${e.length} 个")}),
    // TableData.index(),
    TableData.index(width: 80),
    ColumnData(title: "Id", key: "id", width: 80),
    ColumnData(title: "账号", key: "userName", width: 80),
    ColumnData(title: "密码", key: "password"),
    ColumnData(title: "盐", key: "salt"),
    ColumnData(title: "创建时间", key: "createTime"),
    ColumnData(title: "昵称", key: "nickName"),
    TableData.edit(edit: (d) {
      MessageUtil.show("编辑$d");
    }, delete: (d) {
      MessageUtil.show("删除:$d");
    }),
  ];

  var form = FormDto(labelWidth: 80, columns: [
    FormColumnDto(
      label: "账号",
      key: "userName",
      placeholder: "请输入账号",
    ),
    FormColumnDto(
        label: "密码",
        key: "password",
        placeholder: "请输入密码",
        type: FormColumnEnum.password),
    FormColumnDto(
      label: "盐",
      key: "salt",
      placeholder: "请输入盐",
    ),
    FormColumnDto(
      label: "昵称",
      key: "nickName",
      placeholder: "请输入昵称",
    ),
  ]);

  void add() {
    form.data = {};
    UiEdit.requestForm(form,
        submit: (data) => {
              AdminApi.adminInsert(params: data).then((value) {
                MessageUtil.show("插入成功!");
                find(size, page);
                Get.back();
              })
            });
  }
}
