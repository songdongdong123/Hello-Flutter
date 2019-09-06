import 'package:flutter/material.dart'; 
import './demo/draw_demo.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false, //用户关闭debug模式下右上角的debug提示
      home: Home(),
      theme: ThemeData( // 部件主体颜色
        primaryColor: Colors.yellow,
        highlightColor: Color.fromRGBO(255,255,255,0.5), // 更改点击高亮的颜色
        splashColor: Colors.white70 //更改水波纹的颜色
      ),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton( //去掉顶部手动添加的menu图片，draw会自动创建menu图片并关联点击打开抽屉
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigation',
          //   onPressed: () => debugPrint('Navigation button is pressed'),
          // ),
          title: Text("QUNIMADE"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('搜索按钮被点击了'),
            )
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38, //未选中标签颜色设置
            indicatorColor: Colors.black54, //设置指示器颜色
            indicatorSize: TabBarIndicatorSize.label, //设置指示器大小
            indicatorWeight: 1.0, //设置指示器宽度
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
            Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
        drawer: DrawDemo()
      ),
    );
  }
}

// Container(// drawer左边抽屉， endDrawer右边抽屉
//           color: Colors.white,
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('这是抽屉栏')
//             ],
//           ),
//         ),