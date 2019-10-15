import 'package:flutter/material.dart';
class FloatingActionButtonDemo extends StatelessWidget {
  // 漂浮按钮demo
  final Widget _floatingActionButton = FloatingActionButton(
    // 不带文字的漂浮按钮
    onPressed: () {
      // 点击事件
    },
    child: Icon(Icons.add), //要显示的图标
    elevation: 0.0, //层级
    backgroundColor: Colors.black87, //背景颜色
    // shape: BeveledRectangleBorder( //改变漂浮按钮的形状，默认为圆形
    //   borderRadius: BorderRadius.circular(30.0)
    // ),
  );

  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    // 带文字的漂浮按钮
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text('Add'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      // floatingActionButton用来设置漂浮按钮
      floatingActionButton: _floatingActionButton,
      // 底部工具栏的设置
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        // 如果设置了floatingActionButtonLocation，可以在贴合部分打开一个相对应的缺口
        shape: CircularNotchedRectangle(),
      ),
      // 如果不设置floatingActionButtonLocation，漂浮按钮会在底部工具栏的顶部
      // 如果设置了，漂浮按钮会和底部工具栏贴合在一起
      // FloatingActionButtonLocation.endDocked //靠右边贴合
      // FloatingActionButtonLocation.centerDocked //靠右边贴合
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}