import 'package:admin_flutter/component/ui_edit.dart';
import 'package:admin_flutter/theme/theme_util.dart';
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

  /// 是否开启边框
  final bool isBorder;

  /// 开启索引栏
  final bool isIndex;

  /// 多选列表
  final list = <Map<String, dynamic>>[].obs;

  TableData(
      {required this.columns,
      required this.rows,
      this.headerHeight = 50,
      this.isZebra = true,
        this.isBorder = false,
      this.cellHeight = 50,
      this.isIndex = false});






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

  /// value 实际显示的值， data 当前行的数据， index 当前行的索引 table 当前表格的数据
  final Widget Function(
      dynamic value, Map<String, dynamic> data, int index, TableData) render;

  /// 标题渲染函数
  final Widget Function(String, TableData) titleRender;

  ColumnData(
      {required this.title,
      required this.key,
      this.width = 0,
      this.render = defaultRender,
      this.titleRender = defaultTitleRender,
      this.alignment = Alignment.center});

  static Widget defaultRender(dynamic value, Map<String, dynamic> data, int index, TableData tableData){
    return Text("$value");
  }

  static Widget defaultTitleRender(String title, TableData table){
    return Text(title,    style: const TextStyle(fontSize: 18),);
  }
}
