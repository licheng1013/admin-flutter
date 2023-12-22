import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableData {
  /// 表头字段
  final List<ColumnData> columns;

  /// 数据
  final List<Map<String, dynamic>> rows;

  /// 表头高度
  final double headerHeight;

  /// 是否开启斑马线
  final bool isZebra;

  /// 单元格高度
  final double cellHeight;

  /// 开启索引栏
  final bool isIndex;

  /// 多选列表
  final list = <Map<String, dynamic>>[].obs;

  TableData(
      {required this.columns,
      required this.rows,
      this.headerHeight = 50,
      this.isZebra = true,
      this.cellHeight = 50,
      this.isIndex = false});

  static ColumnData multipleSelect(
      {Function(List<Map<String, dynamic>>)? selectList}) {
    return ColumnData(
        title: "多选",
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

  static ColumnData index() {
    return ColumnData(
        title: "序号",
        key: "id-key",
        render: (value, row, index, table) => Text("${index + 1}"),
        alignment: Alignment.center);
  }

  /// 将动态列表转换为Map列表
  static List<Map<String, dynamic>> listDyToMap(List<dynamic> list) {
    var result = <Map<String, dynamic>>[];
    for (var element in list) {
      result.add(element as Map<String, dynamic>);
    }
    return result;
  }
}

class ColumnData {
  /// 标题
  final String title;

  /// 宽度
  final String key;

  /// 0 为自适应
  final double width;

  /// 方向
  final Alignment alignment;

  /// 渲染函数
  final Widget Function(dynamic, Map<String, dynamic>, int, TableData)? render;

  /// 标题渲染函数
  final Widget Function(String, TableData)? titleRender;

  ColumnData(
      {required this.title,
      required this.key,
      this.width = 0,
      this.render,
      this.titleRender,
      this.alignment = Alignment.center});
}
