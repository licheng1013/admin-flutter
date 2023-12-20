import 'package:app_template/component/table/table_data.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TablePage extends StatelessWidget {
  final TableData tableData;

  TablePage({Key? key, required this.tableData}) : super(key: key);

  final logic = Get.put(TableLogic());
  final state = Get.find<TableLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _table(tableData),
        Expanded(
          child: ListView(
            children: [
              for (var i = 0; i < tableData.rows.length; i++)
                Container(
                  color: tableData.isZebra && i % 2 == 0
                      ? Colors.grey.shade100
                      : Colors.white,
                  height: tableData.cellHeight,
                  child: Row(
                    children: [
                      for (var column in tableData.columns)
                        Expanded(
                            child: Align(
                              alignment: column.alignment,
                          child: column.render == null
                              ? Text(tableData.rows[i][column.key].toString())
                              : column.render!(tableData.rows[i][column.key],
                                  tableData.rows[i], i, tableData),
                        ))
                    ],
                  ),
                )
            ],
          ),
        )
      ],
    );
  }

  // 表头
  Widget _table(TableData table) {
    return Column(
      children: [
        SizedBox(
          height: table.headerHeight,
          child: Row(
            children: [
              for (var item in table.columns)
                Expanded(
                    child: Align(
                      alignment: item.alignment,
                      child: item.titleRender == null
                          ? Text(
                        item.title,
                        style: const TextStyle(fontSize: 18),
                      )
                          : item.titleRender!(item.title,table),
                    ))
            ],
          ),
        ),
        ThemeUtil.lineH()
      ],
    );
  }
}
