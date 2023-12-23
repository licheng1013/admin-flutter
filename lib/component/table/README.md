# Table组件

- 参考文件 [table_data.dart](table_data.dart)

## TableData

```dart
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
}
```

## ColumnData

```dart
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
}
```
