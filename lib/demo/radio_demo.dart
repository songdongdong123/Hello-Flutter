import 'package:flutter/material.dart';
class RadioDemo extends StatefulWidget {
  // 单选按钮
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0; // 初始化群组值

  void _handleRadioValueChange (int value) {
    // 修改单选框的群组值
    setState(() {
      _radioGroupA = value; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //basic_demo.dart
          children: <Widget>[
            Text('RadioGroupValue: $_radioGroupA'),
            SizedBox(height: 32.0,),
            // 可以带标题副标题以及图标的单选框项
            RadioListTile(
              value: 0,
              groupValue: _radioGroupA,
              onChanged: _handleRadioValueChange,
              title: Text('Options A'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroupA == 0, //设置文字和图标是否随着单选框被激活而激活
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroupA,
              onChanged: _handleRadioValueChange,
              title: Text('Options B'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_2),
              selected: _radioGroupA == 1, //设置文字和图标是否随着单选框被激活而激活
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Radio(
                //   value: 0,
                //   groupValue: _radioGroupA,
                //   onChanged: _handleRadioValueChange, // 当单选框状态改变时，修改群组值
                //   activeColor: Colors.black,
                // ),
                // Radio(
                //   value: 1,
                //   groupValue: _radioGroupA,
                //   onChanged: _handleRadioValueChange,
                //   activeColor: Colors.black, // 选中状态下的颜色
                // ),
                // Radio(
                //   value: 2,
                //   groupValue: _radioGroupA,
                //   onChanged: _handleRadioValueChange,
                //   activeColor: Colors.black,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}