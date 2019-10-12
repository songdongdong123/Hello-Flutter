import 'package:flutter/material.dart'; 
import './post_show.dart';
import '../model/post.dart';
class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container( //容器，相当于web应用中的div元素
      color: Colors.white, // Container容器的背景颜色
      margin: EdgeInsets.all(8.0), //容器部件的整体外边距
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[ //children表示多个子部件 <Widget>[]表示子部件内部使用Widget规范（我猜的）
              AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
              ),
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
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  // debugPrint('onTap');
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostShow(post: posts[index]))
                  );
                },
              ),
            ),
          )
        ],
      ),
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