import 'package:admin_flutter/api/user_api.dart';
import 'package:admin_flutter/component/form/enum.dart';
import 'package:admin_flutter/component/form/form_data.dart';
import 'package:admin_flutter/component/table/ex.dart';
import 'package:admin_flutter/component/table/table_data.dart';
import 'package:admin_flutter/component/ui_edit.dart';
import 'package:admin_flutter/ex/ex_hint.dart';
import 'package:admin_flutter/ex/ex_list.dart';
import 'package:get/get.dart';


class AdminLogic extends GetxController {

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
    UserApi.userList(params: {
      "size": size,
      "page": page,
    }).then((value) async {
      total.value = value["total"];
      list.addAll((value["list"] as List<dynamic>).toListMap());
      list.refresh();
      // 休眠 300 毫米
      await Future.delayed(const Duration(milliseconds: 300));
      loading.value = false;
    });
  }

  var columns = <ColumnData>[];

  @override
  void onInit() {
    super.onInit();
    columns = [
      ColumnData(title: "Id", key: "id", width: 80),
      ColumnData(title: "账号", key: "userName"),
      ColumnData(title: "密码", key: "password"),
      ColumnData(title: "盐", key: "salt"),
      ColumnData(title: "昵称", key: "nickName"),
      ColumnData(title: "创建时间", key: "createTime"),
      TableEx.edit(edit: (d,index) {
        form.data = d;
        form.title = "编辑";
        form.edit(
            submit: (data) => {
                  UserApi.userUpdate(params: data).then((value) {
                    "更新成功!".toHint();
                    list.removeAt(index);
                    list.insert(index, data);
                    Get.back();
                  })
                });
      }, delete: (d,index) {
        UserApi.userDelete(params: {"id": d["id"]}).then((value) {
          list.removeAt(index);
        });
      }),
    ];
  }

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
    form.title = "添加";
    form.edit(
        submit: (data) => {
              UserApi.userInsert(params: data).then((value) {
                "插入成功!".toHint();
                find(size, page);
                Get.back();
              })
            });

  }
}
