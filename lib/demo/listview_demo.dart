import 'package:flutter/material.dart'; 
import '../model/post.dart';
class ListViewDemo extends StatelessWidget {
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
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}