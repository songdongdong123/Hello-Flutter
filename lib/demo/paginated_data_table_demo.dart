import 'package:flutter/material.dart';
import '../model/post.dart';
class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListDataTable(),
          ],
        ),
      ),
    );
  }
}

// 使用列表生成DataTable
class ListDataTable extends StatefulWidget {
  @override
  _ListDataTableState createState() => _ListDataTableState();
}

class _ListDataTableState extends State<ListDataTable> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      // onSelectAll: (bool value) {},
      sortColumnIndex: _sortColumnIndex, //基于什么排序的（这里用数组下标）
      sortAscending: _sortAscending, //排序方式，升序降序
      // 数据表格的栏目(表格的标题栏目)
      columns: [
        DataColumn(
            label: Text('Title'),
            onSort: (int index, bool ascending) {
              setState(() {
                // 排序
                _sortColumnIndex = index;
                _sortAscending = ascending;
                posts.sort((a, b) {
                  if (!ascending) {
                    final c = a;
                    a = b;
                    b = c;
                  }

                  return a.title.length.compareTo(b.title.length);
                });
              });
            }),
        // DataColumn(
        //   // 这里可以使用Container改变label的宽度和高度
        //   label: Container(
        //     width: 200.0,
        //     child: Text('Title'),
        //   ),
        // ),
        DataColumn(label: Text('Author')),
        DataColumn(label: Text('Image'))
      ],
      // 表格的具体栏目
      rows: posts.map((post) {
        return DataRow(
          selected: post.selected,
          onSelectChanged: (bool value) {
            setState(() {
              if (post.selected != value) {
                post.selected = value;
              } 
            });
          },
          cells: [
            DataCell(Text(post.title)),
            DataCell(Text(post.author)),
            DataCell(Image.network(post.imageUrl))
        ]);
      }).toList(),
    );
  }
}