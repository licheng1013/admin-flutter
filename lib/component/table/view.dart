import 'package:app_template/app/home/head/view.dart';
import 'package:app_template/component/table/table_data.dart';
import 'package:app_template/ex/ex_list.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TablePage extends StatelessWidget {
  final TableData tableData;
  final bool loading;

  TablePage({Key? key, required this.tableData, this.loading = false})
      : super(key: key);

  final logic = Get.put(TableLogic());

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _loading() {
    return Center(
      child:
          // 进度条
          SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          // 调整大小
          backgroundColor: UiTheme.onPrimary(),
          valueColor:  AlwaysStoppedAnimation(UiTheme.primary()),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _table(tableData),
        Expanded(child: loading ? _loading() : _data())
      ],
    );
  }

  Widget _data() {
    return ListView(children: tableData.rows.toWidgetsWithIndex((e, index) {
      var zebra = tableData.isZebra && index % 2 == 0;
      var color = zebra ? UiTheme.background() : UiTheme.primary().withAlpha(75);
      return Container(
        color: color,
        height: tableData.cellHeight,
        child: Row(
            children: tableData.columns.toWidgets((e) => _buildData(e, index))),
      );
    }));
  }

  Widget _buildData(ColumnData column, int i) {
    var body = Align(
      alignment: column.alignment,
      child: column.render == null
          ? Text(tableData.rows[i][column.key].toString())
          : column.render!(
              tableData.rows[i][column.key], tableData.rows[i], i, tableData),
    );
    if (column.width != 0) {
      return SizedBox(width: column.width, child: body);
    }
    return Expanded(child: body);
  }

  Widget _buildTitle(ColumnData item, TableData table) {
    var body = Align(
      alignment: item.alignment,
      child: item.titleRender == null
          ? Text(
              item.title,
              style: const TextStyle(fontSize: 18),
            )
          : item.titleRender!(item.title, table),
    );
    if (item.width != 0) {
      return SizedBox(width: item.width, child: body);
    }
    return Expanded(child: body);
  }

  // 表头
  Widget _table(TableData table) {
    return Column(
      children: [
        SizedBox(
          height: table.headerHeight,
          child: Row(
            children: [
              for (var item in table.columns) _buildTitle(item, table)
            ],
          ),
        ),
        ThemeUtil.lineH()
      ],
    );
  }
}
