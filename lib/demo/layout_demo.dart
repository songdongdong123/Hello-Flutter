import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        // Row代表子部件会水平排列
        // Column代表子部件会竖直排列
        // 设置主轴对齐方式，对应css的flex布局
        // 如果使用Row就是水平主轴， 如果使用Column就是竖直主轴
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment交叉轴的设置
        // 如果使用Row交叉轴就是竖直的
        // 如果使用Column交叉轴就是水平的
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // children代表的是一组子部件
          // child代表的是唯一的子部件
          StackDemo()
        ],
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.topLeft, //设置对齐方式
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            alignment: Alignment(0.0, 0.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        SizedBox(
          height: 32.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(1, 102, 255, 1.0),
                  Color.fromRGBO(3, 54, 255, 1.0)
                ])),
            child: Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
          ),
        ),
        // 这里相当于css中position：absolute
        // 而父部件默认是relative
        Positioned(
          right: 20.0,
          top: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
        ),
        Positioned(
          right: 20.0,
          top: 120.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
        ),
        Positioned(
          right: 70.0,
          top: 180.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
        Positioned(
          right: 30.0,
          top: 230.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
        ),
        Positioned(
          right: 90.0,
          top: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
        Positioned(
          right: 4.0,
          top: -4.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        )
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
