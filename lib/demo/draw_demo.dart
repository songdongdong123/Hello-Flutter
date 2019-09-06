import 'package:flutter/material.dart';

class DrawDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      // 添加drawer抽屉部件，material会帮我们创建menu图标并关联点击打开事件
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader( //这是一个普通的抽屉头部组件
          //   child: Text('header'.toUpperCase()),
          //   decoration: BoxDecoration(
          //     color: Colors.yellow,
          //   ),
          // ),
          UserAccountsDrawerHeader(
            accountName: Text('Ethan',
                style: TextStyle(fontWeight: FontWeight.bold)), //设置账户名称
            accountEmail: Text('172529131@qq.com'), //邮箱地址
            currentAccountPicture: CircleAvatar(
              // 用户头像设置
              backgroundImage: NetworkImage(
                  'http://b-ssl.duitang.com/uploads/item/201809/26/20180926162125_vjbwi.jpg'),
            ),
            decoration: BoxDecoration(
                //头部组件背景设置
                color: Colors.yellow[400], //背景颜色设置
                image: DecorationImage(
                    image: NetworkImage(
                        'http://cdn.duitang.com/uploads/item/201410/16/20141016202155_5ycRZ.thumb.700_0.jpeg'), //背景图片
                    fit: BoxFit.cover, //填充方式（铺满容器）
                    colorFilter: ColorFilter.mode(
                        // 添加滤镜
                        Colors.yellow[400].withOpacity(0.6),
                        BlendMode.hardLight))),
          ),
          ListTile(
            title: Text(
              'Message',
              textAlign: TextAlign.left,
            ),
            // leading文字前面显示
            // trailing文字后面显示
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'Favorite',
              textAlign: TextAlign.left,
            ),
            // leading文字前面显示
            // trailing文字后面显示
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'Settings',
              textAlign: TextAlign.left,
            ),
            // leading文字前面显示
            // trailing文字后面显示
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
