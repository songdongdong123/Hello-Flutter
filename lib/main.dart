import 'package:flutter/material.dart'; 
import './model/post.dart';
// material包是Flutter实现Material Design设计风格的基础包，
// 其中有Text、Icon、Image等基础控件，有Align、Column、Decoration等布局控件，更多的还有异步控件、动画控件以及其他函数与方法。
void main () => runApp(App());

// 自定义小部件（视图分离）
// class App extends StatelessWidget {
//   @override
//   Widget build (BuildContext context) {
//     return Center ( // center是一个居中内部元素的控件
//       child: Text( // child表示子控件
//         'hello ETHAN', // 第一个参数表示text控件要显示的文本
//         textDirection: TextDirection.ltr, // 文字的对其方式
//         style: TextStyle( // 文本样式
//           fontSize: 40.0, // 字体大小
//           fontWeight: FontWeight.bold, // 字体粗细
//           color: Colors.blue,//字体颜色
//         ),
//       ),
//     );
//   }
// }

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar( //顶部导航title
//           title: Text('NINGHAO'),
//           elevation: 0.0, //topBar阴影设置
//         ),
//         body: Hello(), //页面主体
//       ),
//       theme: ThemeData( // 部件主体颜色
//         primaryColor: Colors.yellow 
//       ),
//     );
//   }
// }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Home(),
      theme: ThemeData( // 部件主体颜色
        primaryColor: Colors.yellow 
      ),
    );
  }
}

class Home extends StatelessWidget{
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container( //容器，相当于web应用中的div元素
      color: Colors.white, // Container容器的背景颜色
      margin: EdgeInsets.all(8.0), //容器部件的整体外边距
      child: Column(
        children: <Widget>[ //children表示多个子部件 <Widget>[]表示子部件内部使用Widget规范（我猜的）
          Image.network(posts[index].imageUrl),
          SizedBox(height: 16.0),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.title
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subhead
          ),
          SizedBox(height: 16.0,)
        ],
      ), //是一个使内部子部件竖直排列的容器
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.pink, // Scaffold的背景颜色
        appBar: AppBar( //顶部导航title
          title: Text('NINGHAO'),
          elevation: 0.0, //topBar阴影设置
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: _listItemBuilder,
        ), //页面主体
      );
      
  }
}

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