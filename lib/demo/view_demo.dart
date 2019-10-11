import 'package:flutter/material.dart';
import '../model/post.dart';
class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageViewBuilderDemo();
  }
}


class PageViewBuilderDemo extends StatelessWidget {
  // 按需生成页面视图
  Widget _pageItemBuilder (BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style:TextStyle(fontWeight: FontWeight.bold)
              ),
              Text(
                posts[index].author
              )
            ],
          ),
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}



class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      //控制页面滑到过半的时候，松开手指是否自动滑动到下一页，默认true
      // pageSnapping: false, 
      //用来倒置页面视图的顺序
      // reverse: false, 
      //控制页面滚动方向,默认为左右滚动，Axis.vertical（上下滚动）
      // scrollDirection: Axis.vertical,
      //翻页时的回调函数
      onPageChanged: (currentPage) => debugPrint('page: $currentPage'),
      // 控制页面的显示
      controller: PageController(
        initialPage: 1, //初始化显示的页面的索引,默认0
        keepPage: false, //是否保存用户当前所滑动到的页面，默认true
        viewportFraction: 0.85//页面视图所占页面的比例，默认是1
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'THREE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        )
      ],
    );
  }
}