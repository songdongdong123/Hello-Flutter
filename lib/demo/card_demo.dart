import 'package:flutter/material.dart';
import '../model/post.dart';
class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: CardList(),
      ),
    );
  }
}


class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: posts.map((post) {
          return Card( // Card默认会有一个4.0的圆角效果
            child: Column(
              children: <Widget>[
                AspectRatio(//AspectRatio的作用是调整child到设置的宽高比，
                  aspectRatio: 16/9,
                  child: ClipRRect( // ClipRRect可以给child剪裁圆角
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0)
                    ),
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover
                    ),
                  )
                ),
                ListTile(
                  leading: CircleAvatar( // 默认为一个圆形的小容器，可以用作用户图像的显示
                    backgroundImage: NetworkImage(post.imageUrl),
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.author),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(post.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                ),
                // 可以添加一组按钮
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Like'.toLowerCase()),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text('Read'.toLowerCase()),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}