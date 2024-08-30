import 'package:admin_flutter/component/table/table_data.dart';
import 'package:admin_flutter/ex/ex_list.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
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



  Widget _body() {
    return Column(
      children: [
        _table(tableData),
        Expanded(child: loading ? UiTheme.loading() : _data())
      ],
    );
  }

  Widget _data() {
    return ListView(children: tableData.rows.toWidgetsWithIndex((e, index) {
      var zebra = tableData.isZebra && index % 2 == 0;
      var color =
          zebra ? UiTheme.background() : UiTheme.primary2();
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
      child: column.render(
          tableData.rows[i][column.key], tableData.rows[i], i, tableData),
    );
    return column.width == 0
        ? Expanded(child: _bodyView(double.infinity, body))
        : _bodyView(column.width, body);
  }

  Widget _bodyView(double width, Widget child) {
    return Container(
      // 边框线
      decoration: tableData.isBorder
          ? BoxDecoration(
              border: Border.all(color: UiTheme.primary(), width: 0.3),
            )
          : null,
      width: width,
      child: child,
    );
  }

  Widget _buildTitle(ColumnData item, TableData table) {
    var body = Align(
      alignment: item.alignment,
      child: item.titleRender(item.title, table),
    );
    return item.width == 0
        ? Expanded(child: _bodyView(double.infinity, body))
        : _bodyView(item.width, body);
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
