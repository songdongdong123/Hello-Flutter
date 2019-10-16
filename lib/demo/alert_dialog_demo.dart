import 'package:flutter/material.dart';
import 'dart:async';
enum Action {
  Ok,
  Cancel
}

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  // alter弹窗的基本使用

  String _choice = 'Nothing';
  // Future相当于js中的promise对象
  Future _openAlertDialog () async { // async表示该函数是一个异步函数
    // await showDialog() 会返回按钮操作的值
    final action = await showDialog(
      context: context,
      barrierDismissible: false, //设置点击空白区域不关闭弹窗
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[ //设置alert弹窗的操作按钮
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                // 关闭弹窗，并传递参数
                Navigator.pop(context, Action.Ok); // 关闭弹窗
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, Action.Cancel);
              },
            ),
          ],
        );
      }
    );

    // 获取参数设置_choice
    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = 'Ok'; 
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = 'Cancel'; 
        });
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //basic_demo.dart
          children: <Widget>[
            Text('Your choice is: $_choice'),
            SizedBox(height: 32.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: _openAlertDialog,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}