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

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;
  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    final Post post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl))
      ]
    );
  }

  void _sort (getField(post), bool ascending) {
    _posts.sort((a,b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

// 分页DataTable
class ListDataTable extends StatefulWidget {
  @override
  _ListDataTableState createState() => _ListDataTableState();
}


class _ListDataTableState extends State<ListDataTable> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  final PostDataSource _postDataSource =  PostDataSource();
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      header: Text('Posts'),
      rowsPerPage: 5,
      source: _postDataSource,
      sortColumnIndex: _sortColumnIndex, //基于什么排序的（这里用数组下标）
      sortAscending: _sortAscending, //排序方式，升序降序
      // 数据表格的栏目(表格的标题栏目)
      columns: [
        DataColumn(
            label: Text('Title'),
            onSort: (int columnIndex, bool ascending) {
              _postDataSource._sort((post) => post.title.length, ascending);
              setState(() {
                // 排序
                _sortColumnIndex = columnIndex;
                _sortAscending = ascending;
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
    );
  }
}