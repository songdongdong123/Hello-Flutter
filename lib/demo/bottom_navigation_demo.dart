import 'package:flutter/material.dart';

class BottomNavigationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationDemo> {
  int _currentIndex = 0;
  void _onTabHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      //底部导航配置
      onTap: _onTabHandler, //添加底部导航点击事件
      currentIndex: _currentIndex, // 控制底部导航激活状态
      //当导航选项大于4个的时候，导航器类型会改变，从而显示不出来，这个时候就需要设置type属性
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black, //导航选项激活状态颜色(如果不设置，默认使用MaterialApp主题颜色)
      items: [
        //抽屉导航项目的设置
        BottomNavigationBarItem(
            icon: Icon(Icons.explore), title: Text('Explore')),
        BottomNavigationBarItem(
            icon: Icon(Icons.history), title: Text('History')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('List')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('My'))
      ],
    );
  }
}
