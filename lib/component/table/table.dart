
import 'package:flutter/cupertino.dart';

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

  TableData({required this.columns, required this.rows, this.headerHeight = 50, this.isZebra = true, this.cellHeight = 50, this.isIndex = false});
}

class ColumnData {
  /// 标题
  final String title;

  /// 宽度
  final String key;

  /// 0 为自适应
  final double width;

  /// 方向
  final Alignment alignment ;

  /// 渲染函数
  final Widget Function(dynamic,Map<String,dynamic>,int)? render;

  ColumnData({required this.title, required this.key,
    this.width = 0, this.render , this.alignment = Alignment.center});
}
