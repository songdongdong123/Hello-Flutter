import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerDemo();
  }
}

// 容器Container,默认容器大小是铺满整个屏幕的,
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Border _borderStyle = Border(
      // 这里可以使用top, bottom, left, right分别设置上下左右四个方向的边框表现形式
      top: BorderSide(
        color: Colors.indigoAccent[100],
        width: 3.0,
        style: BorderStyle.solid
      ),
      bottom: BorderSide(
        color: Colors.indigoAccent[100],
        width: 3.0,
        style: BorderStyle.solid
      )
    );
    final Border _borderAllStyle = Border.all(
      // 也可以使用border: Border.all(), 一次性设置四个边框，其表现形式为相同
      color: Colors.indigoAccent[100],
      width: 3.0,
      style: BorderStyle.solid
    );
    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration( //设置容器的背景图片
        image: DecorationImage(
          image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567855557851&di=f642510d956288c9078e59c72ad96e36&imgtype=0&src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_bt%2F0%2F9933443119%2F1000.jpg'),
          alignment: Alignment.topCenter, //图片位置
          fit: BoxFit.cover, //图片填充方式
          colorFilter: ColorFilter.mode( // 添加滤镜
            Colors.indigoAccent[400].withOpacity(0.5), //滤镜颜色
            BlendMode.hardLight, // 混合模式
          )
        )
      ),
      // child是填充在父部件中的子组件要填充的内容，可以层层嵌套
      child: Row( // 使用Row可以使子部件垂直居中, 使用Column可以使子部件水平居中
        mainAxisAlignment: MainAxisAlignment.center, // 设置children对齐方式（水平对齐）
        children: <Widget>[
          // 关于flutter里面的child和children的区别就是独生子女和非独生子女，
          // child所包含的元素只有一个，而children是多个所以它里面是数组
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(3, 54, 255, 1.0), // Color.fromRGBO(r,g,b, o)
            //EdgeInsets.all(value)将上下左右设置为同一个值
            // EdgeInsets.only(left:value, right: value, top: value, bottom: value)可以单独设置一个方向的值
            padding: EdgeInsets.all(16.0), 
            margin: EdgeInsets.all(8.0),
            width: 90.0, //设置容器的宽度
            height: 90.0, //设置容器的高度
            //BoxDecoration装饰器，可以用来修饰其他的组件,这里可以理解为会容器添加额外的描述， 比如边框阴影等
            // 当开启了decoration就要注释掉container下面的color，否则就会引起冲突报错
            decoration: BoxDecoration(
              color:  Color.fromRGBO(3, 54, 255, 1.0),
              // _borderAllStyle一次性设置四个边框
              // _borderStyle分别设置四个边框
              border: _borderAllStyle,
              // borderRadius: BorderRadius.circular(16.0),
              /** 
               * 也可以使用BorderRadius.only(
               *  topLeft: Radius.circular(64.0),
               *  bottomLeft: Radius.circular(64.0),
               *  ......
               * )
               * 
               * */
              boxShadow: [ // 阴影
                 BoxShadow(
                   offset: Offset(1.0, 1.0), // 第一个参数X轴偏移量， 第二个参数Y轴偏移量（正负数）
                   color: Color.fromRGBO(16, 20, 188, 1.0), //阴影的颜色设置（默认为黑色）
                   blurRadius: 25.0, //阴影的模糊程度
                   spreadRadius: 6.0, //阴影的扩散程度
                 )
              ],  
              shape: BoxShape.circle, // 设置容器的形状circle圆形, shape设置为圆形的话，要注释borderRadius，否则会引起冲突
            ),
          )
        ],
      ),
    );
  }
}

// 可以在一行文字中设置多种样式
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
        text: "Ethan",
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100
        ),
        children: [
          TextSpan(
            text: ".com",
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.grey
            )
          )
        ]
      ),
    );
  }
}

// 普通文字
class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
      fontSize: 16.0,
    );
    final String _auther = "先秦：佚名";
    final String _title = "《国风·周南·关雎》";
    return Text(
      "$_auther-$_title 关关雎鸠，在河之洲。窈窕淑女，君子好逑。参差荇菜，左右流之。窈窕淑女，寤寐求之。求之不得，寤寐思服。悠哉悠哉，辗转反侧。参差荇菜，左右采之。窈窕淑女，琴瑟友之。参差荇菜，左右芼之。窈窕淑女，钟鼓乐之。",
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}