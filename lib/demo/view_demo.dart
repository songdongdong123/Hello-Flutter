import 'package:flutter/material.dart';
import '../model/post.dart';
class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {

  Widget _gridItemBuilder (BuildContext context, int index) {
    return Container(
      child: Image.network( // 加载网络图片
        posts[index].imageUrl, //图片地址
        fit: BoxFit.cover, //图片填充方式
      ),
    );
  }

  // 按需生成网格式图
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length, // 网格的个数
      itemBuilder: _gridItemBuilder, // 生成网格式图
      // SliverGridDelegateWithMaxCrossAxisExtent 用于创建具有最大横轴范围的 网格块 的布局。
      // SliverGridDelegateWithFixedCrossAxisCount 它创建一个在横轴上具有固定数量的 网格块 的布局。
      // gridDelegate 一个控制 GridView 中子项布局的委托。
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
        crossAxisCount: 2, //个数
        crossAxisSpacing: 8.0, // 横轴间距
        mainAxisSpacing: 8.0, // 竖轴间距
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  // 生成网格视图的另一种方式

   // 该方法返回一个List类型的Widget
  List<Widget> _buildTitles (int length) {
    return List.generate(length, (int index) {
      return Container(
          color: Colors.grey[300],
          alignment: Alignment(0.0, 0.0), //对齐方式
          child: Text(
            'Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 280.0, //横轴的最大长度
      crossAxisSpacing: 16.0, //横轴间隔
      mainAxisSpacing: 16.0, //主轴间隔
      // 方向是垂直的时候 主轴是垂直的, 反之主轴就是水平的
      // scrollDirection: Axis.horizontal, //控制滚动方向，默认是垂直的，这里修改为了水平的
      children: _buildTitles(100)
    );
  }
}


class GridViewCountDemo extends StatelessWidget {
  // 生成网格视图

   // 该方法返回一个List类型的Widget
  List<Widget> _buildTitles (int length) {
    return List.generate(length, (int index) {
      return Container(
          color: Colors.grey[300],
          alignment: Alignment(0.0, 0.0), //对齐方式
          child: Text(
            'Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      // 横轴数量 这里的横轴就是x轴 因为方向是垂直的时候 主轴是垂直的, 反之主轴就是水平的
      crossAxisCount: 3, //交叉轴个数，这里表示一排三个
      crossAxisSpacing: 16.0, //横轴间隔
      mainAxisSpacing: 16.0, //主轴间隔
      // 方向是垂直的时候 主轴是垂直的, 反之主轴就是水平的
      scrollDirection: Axis.horizontal, //控制滚动方向，默认是垂直的，这里修改为了水平的
      children: _buildTitles(100)
    );
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