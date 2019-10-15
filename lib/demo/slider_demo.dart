import 'package:flutter/material.dart';
class SliderDemo extends StatefulWidget {
  // 滑动选择器小部件
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
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
                Slider(
                  value: _sliderItemA, //滑动选择器当前的值
                  onChanged: (value) { //滑动滑动选择器时触发的回调
                    setState(() {
                      _sliderItemA = value; 
                    });
                  },
                  activeColor: Theme.of(context).accentColor, //已经选择部分的颜色
                  inactiveColor: Theme.of(context).accentColor.withOpacity(0.3), // 为选择部分的颜色设置
                  min: 0.0, // 最小值如果不设置，默认是0.0-1.0
                  max: 10.0, // 最大值
                  divisions: 10, // 分割的份数
                  label: '${_sliderItemA.toInt()}', //滑动时，顶部会显示一个小标签，来展示当前的value
                ),
              ],
            ),
            SizedBox(height: 16.0,),
            Text('SliderValue: $_sliderItemA')
          ],
        ),
      ),
    );
  }
}