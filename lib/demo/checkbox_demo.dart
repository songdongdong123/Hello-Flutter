import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxItemA = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckboxDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //basic_demo.dart
          children: <Widget>[
            CheckboxListTile(
              // 带标题，icon的复选框项
              value: _checkboxItemA, //复选框状态
              onChanged: (value) { // 修改复选框状态
                setState(() {
                  _checkboxItemA = value; 
                });
              },
              title: Text('Checkbox Item A'), // 复选框项的标题
              subtitle: Text('Description'), // 复选框项的副标题
              secondary: Icon(Icons.bookmark), //复选框项的图标
              selected: _checkboxItemA, // 激活状态下的复选框项标题，图标，副标题的激活状态
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Checkbox(
                //   value: _checkboxItemA,
                //   onChanged: (value) {
                //     // 修改复选框的状态
                //     // value复选框的状态
                //     setState(() {
                //       _checkboxItemA = value;
                //     });
                //   },
                //   activeColor: Colors.black, // 选中状颜色
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}