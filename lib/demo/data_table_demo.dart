import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            BaseDataTable(),
            SizedBox(
              height: 16.0,
            ),
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

class BaseDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      // 数据表格的栏目(表格的标题栏目)
      columns: [
        DataColumn(label: Text('Title')),
        DataColumn(label: Text('Author'))
      ],
      // 表格的具体栏目
      rows: [
        // 每一个DataRow就对应一行数据
        DataRow(cells: [
          // 这里的个数和columns中的个数对应
          // DataCell代表一行中的具体项目内容
          DataCell(Text('Hello ~')),
          DataCell(Text('Ethan ~')),
        ]),
        DataRow(cells: [
          DataCell(Text('Hello ~')),
          DataCell(Text('Ethan ~')),
        ])
      ],
    );
  }
}
