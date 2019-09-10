import 'package:flutter/material.dart'; 
import './demo/draw_demo.dart';
import './demo/bottom_navigation_demo.dart';
import './demo/listview_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
// material包是Flutter实现Material Design设计风格的基础包，
// 其中有Text、Icon、Image等基础控件，有Align、Column、Decoration等布局控件，更多的还有异步控件、动画控件以及其他函数与方法。
void main () => runApp(App());
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
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
          ],
        ),
        drawer: DrawDemo(),
        bottomNavigationBar: BottomNavigationDemo()
      ),
    );
  }
}