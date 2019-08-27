import 'package:flutter/material.dart'; 
class Hello extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center ( // center是一个居中内部元素的控件
      child: Text( // child表示子控件
        'hello ETHAN', // 第一个参数表示text控件要显示的文本
        textDirection: TextDirection.ltr, // 文字的对其方式
        style: TextStyle( // 文本样式
          fontSize: 40.0, // 字体大小
          fontWeight: FontWeight.bold, // 字体粗细
          color: Colors.blue,//字体颜色
        ),
      ),
    );
  }
}