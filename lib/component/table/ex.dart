import 'package:admin_flutter/component/table/table_data.dart';
import 'package:admin_flutter/component/ui_edit.dart';
import 'package:admin_flutter/ex/ex_btn.dart';
import 'package:admin_flutter/ex/ex_widget.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableEx {
  /// 索引
  static ColumnData index({double width = 0}) {
    return ColumnData(
        title: "序号",
        key: "id-key",
        width: width,
        render: (value, row, index, table) => Text("${index + 1}"),
        alignment: Alignment.center);
  }

  /// 切换
  static ColumnData switchTo(String key,
      {String title = "启用",
      double width = 0,
      dynamic on = 0,
      dynamic off = 1,
      Function(Map<String, dynamic> row, dynamic newValue)? changed}) {
    return ColumnData(
        title: title,
        key: key,
        width: width,
        render: (value, row, index, table) => Switch(
            value: value.toString() == on.toString(),
            onChanged: (newValue) {
              changed?.call(row, newValue ? on : off);
            }),
        alignment: Alignment.center);
  }

  /// 编辑列
  static ColumnData edit(
      {bool enableRemove = true,
      bool enableEdit = true,
      Function(Map<String, dynamic>)? delete,
      Function(Map<String, dynamic>)? edit}) {
    return ColumnData(
        title: "操作",
        key: "id-edit",
        render: (value, row, index, table) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "编辑".toBtn(
                  onTap: () {
                    edit?.call(row);
                  },
                ).toShow(enableEdit),
                ThemeUtil.width().toShow(enableEdit && enableRemove),
                "删除".toBtn(onTap: () {
                  UiEdit.confirm(submit: () {
                    delete?.call(row);
                  });
                }).toShow(enableRemove),
              ],
            ),
        alignment: Alignment.center);
  }

  /// 多选
  static ColumnData multipleSelect(
      {Function(List<Map<String, dynamic>>)? selectList, double width = 0}) {
    return ColumnData(
        title: "多选",
        width: width,
        key: "multiple-select-key",
        titleRender: (value, table) => Obx(() {
              return Checkbox(
                value: table.rows.length == table.list.length &&
                    table.list.isNotEmpty,
                onChanged: (value) {
                  table.list.clear();
                  if (value == true) {
                    table.list.addAll(table.rows);
                  }
                  table.list.refresh();
                  selectList?.call(table.list);
                },
              );
            }),
        render: (value, row, index, table) => Obx(() {
              return Checkbox(
                value: table.list.contains(row),
                onChanged: (value) {
                  if (value == true) {
                    table.list.add(row);
                  } else {
                    table.list.remove(row);
                  }
                  table.list.refresh();
                  selectList?.call(table.list);
                },
              );
            }),
        alignment: Alignment.center);
  }

  static Widget input({String tip = "请输入搜索信息",Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      // 内容偏移
      child: TextField(
        textAlign: TextAlign.center,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: tip,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
