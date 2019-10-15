import 'package:flutter/material.dart';
class ButtonDemo extends StatelessWidget {
  // 正常按钮的demo
  @override
  Widget build(BuildContext context) {
    // 创建FlatButton
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          // onPressed: null, //按钮禁用
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor, //按钮文字颜色设置
        ),
        FlatButton.icon(
          //带图标的按钮
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          // onPressed: null, //按钮禁用
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor, //按钮文字颜色设置
        ),
      ],
    );

    // 创建RaisesButton
    final Widget raisedBUttonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          // 按钮的主题，颜色形状的修改
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // ),
                shape: StadiumBorder(),
              )),
          child: RaisedButton(
            // RaisedButton默认带填充颜色和凸起效果
            child: Text('Button'),
            onPressed: () {},
            // onPressed: null, //按钮禁用
            splashColor: Colors.grey,
            elevation: 0.0, //用来表示和下一层的层级，使用阴影效果提现出来的
            // color: Theme.of(context).accentColor, // 用来修改填充颜色
            // textColor: Colors.white, //按钮文字颜色设置
            // textTheme: ButtonTextTheme.primary, // 设置按钮文字颜色
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          //带图标的按钮
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          // onPressed: null, //按钮禁用
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor, //按钮文字颜色设置
        ),
      ],
    );

    // 创建OutlineButton
    final Widget outlineBUttonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          // 按钮的主题，颜色形状的修改
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // ),
                shape: StadiumBorder(),
              )),
          child: OutlineButton(
            // OutlineButton是一个描边的button，也就是带边框不带填充颜色的button
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey,
            borderSide: BorderSide(
                //设置描边颜色
                color: Colors.black),
            textColor: Colors.black, // 文字颜色设置
            highlightedBorderColor: Colors.grey, // 高亮时描边的颜色
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          //带图标的按钮
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          // onPressed: null, //按钮禁用
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor, //按钮文字颜色设置
        ),
      ],
    );

    // 创建固定宽度的button
    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130.0,
          child: OutlineButton(
            // OutlineButton是一个描边的button，也就是带边框不带填充颜色的button
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey,
            borderSide: BorderSide(
                //设置描边颜色
                color: Colors.black),
            textColor: Colors.black, // 文字颜色设置
            highlightedBorderColor: Colors.grey, // 高亮时描边的颜色
          ),
        )
      ],
    );

    final Widget expandedButton = Row(
      // 占满可用宽度的button
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          // 使用flex属性提高当前按钮所占宽度的比例
          flex: 2,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(
              color: Colors.black,
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );

    final Widget buttonBarDemo = Row(
      // 一组带边距的横排显示的button
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            ),
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('BUttonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //basic_demo.dart
          children: <Widget>[
            flatButtonDemo,
            raisedBUttonDemo,
            outlineBUttonDemo,
            fixedWidthButton,
            expandedButton,
            buttonBarDemo
          ],
        ),
      ),
    );
  }
}