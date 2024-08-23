import 'dart:convert';
import 'dart:math';

import 'package:admin_flutter/common/http_util.dart';
import 'package:admin_flutter/component/form/enum.dart';
import 'package:admin_flutter/component/form/form_data.dart';
import 'package:admin_flutter/component/ui_edit.dart';
import 'package:admin_flutter/ex/ex_hint.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserLogic extends GetxController {
  var dbList = <Map<String, dynamic>>[].obs;
  var total = 200.obs;
  var list = <Map<String, dynamic>>[].obs;
  var size = 0;
  var page = 0;
  var selList = <Map<String, dynamic>>[].obs;

  Map<String, dynamic> _data(int i) {
    return {
      "id": i,
      "name": "张三$i",
      "age": "张三$i",
      "sex": "张三$i",
      "tel": "张三$i",
    };
  }

  @override
  void onInit() {
    super.onInit();
    for (var i = 1; i <= total.value; i++) {
      dbList.add(_data(i));
    }
  }

  void find() {
    list.clear();
    var start = (page - 1) * size;
    var end = min(start + size, dbList.length);
    list.addAll(dbList.sublist(start, end));
  }

  var form = FormDto(labelWidth: 80, columns: [
    FormColumnDto(label: "名称", key: "name", placeholder: "请输入名称"),
    FormColumnDto(
        placeholder: "请输入年龄",
        label: "年龄",
        key: "age",
       ),
    FormColumnDto(
        placeholder: "请输入性别",
        label: "性别",
        key: "sex",
    ),
    FormColumnDto(
        label: "手机",
        key: "tel",
        type: FormColumnEnum.number,
        maxLength: 11,
        placeholder: "请输入手机"),
  ]);

  void add() {
    form.title = "新增";
    UiEdit.requestForm(form,
        submit: (d) {
          var m = jsonDecode(jsonEncode(d));
          m["id"] = dbList.length * 2;
          dbList.insert(0, m);
          total.value = dbList.length;
          "新增成功!".toHint();
          find();
          Get.back();
        });
  }

  void updateData(Map<String, dynamic> d) {
    form.data = d;
    form.title = "编辑";
    UiEdit.requestForm(form,
        submit: (data) {
          var index = dbList.indexWhere((e) {
            return e["id"] == d["id"];
          });
          if (index != -1) {
            dbList[index] = data;
            find();
          }
          "更新成功!".toHint();
          Get.back();
        });
  }

  void delete(Map<String, dynamic> d) {
    dbList.remove(d);
    total.value = dbList.length;
    find();
    "删除了: ${d["name"]}".toHint();
  }

  void deleteSel() {
    UiEdit.confirm(submit: () {
      for (var e in selList) {
        dbList.remove(e);
      }
      total.value = dbList.length;
      find();
      "删除${selList.length}个数据成功!".toHint();
      selList.clear();
    },content: const Text("正在进行删除操作！"));
  }
}
