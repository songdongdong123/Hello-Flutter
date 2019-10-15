import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //首先安装intl包

import 'dart:async'; // 因为时间处理是一个异步操作，所以到导入dart:async

// 这里的async 和 await 和es6中的async和await是一样的

class DatetimeDemo extends StatefulWidget {
  @override
  _DatetimeDemoState createState() => _DatetimeDemoState();
}

class _DatetimeDemoState extends State<DatetimeDemo> {
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  // Future<void>表示函数会返回一个Future是一个异步对象，相当于js中Promise
  // <void>表示Future最终会返回什么， void表示不返回
  Future<void> _selectDate () async {
    // 显示时间选择器
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate, //初始化选择的日期时间
      firstDate: DateTime(1990), // 最早可选择的时间
      lastDate: DateTime(2100), //最晚可选择的时间
    );

    // 这里在事件选择中，如果点击ok showDatePicker会返回当前选中的时间，点击cancel showDatePicker会返回一个null
    if (date == null) return;
    
    setState(() {
      selectedDate = date; //这里获取时间，并设置到selectedDate上
    });
  }

  Future<void> _selectTime () async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime
    );

    if (time == null) return;

    setState(() {
      selectedTime = time; 
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatetimeDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //basic_demo.dart
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMMMd().format(selectedDate)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectTime,
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}