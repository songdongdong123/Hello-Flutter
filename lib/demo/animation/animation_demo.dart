import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationHome(),
    );
  }
}

class AnimationHome extends StatefulWidget {
  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      // value: 32.0, //动画的初始值
      // lowerBound: 32.0, // 最小值
      // upperBound: 100.0, // 默认值为1.0， 动画结束的最终值
      duration: Duration(milliseconds: 1000), // 动画时长
      vsync: this, // 防止屏幕外动画，消耗资源
    );

    // 设置动画曲线
    curve = CurvedAnimation(parent: animationController, curve: Curves.ease);

    // 使用Tween给Animation设置范围值
    animation = Tween(begin: 32.0, end: 100.0).animate(curve); //设置一对，起始值给动画使用
    // 使用ColorTween给Animation设置颜色范围值
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    // animationController.addListener(() {
    //   setState(() {});
    // });

    animationController.addStatusListener((AnimationStatus status) {
      //监听动画的状态
      // AnimationStatus.forward 向前运行
      // AnimationStatus.completed 运行完成
      // AnimationStatus.dismissed 动画被解除（暂时先这么理解吧）
      print(status);
    });

    // animationController.forward(); //开始执行动画
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose(); //关闭动画
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [animation, animationColor],
        controller: animationController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value, // 这里使用的是Animation添加的范围值
      color: animations[1].value, // 这里使用的是Animation添加的颜色值
      onPressed: () {
        switch (controller.status) {
          // animationController.status获取动画的状态
          case AnimationStatus.completed:
            controller.reverse(); //反转动画的执行
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}
