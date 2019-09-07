import 'package:flutter/material.dart';
class DrawDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(// 添加drawer抽屉部件，material会帮我们创建menu图标并关联点击打开事件
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Ethan',style: TextStyle(fontWeight: FontWeight.bold)), //设置账户名称
            accountEmail: Text('172529131@qq.com'), //邮箱地址
            currentAccountPicture: CircleAvatar(
              // 用户头像设置
              backgroundImage: NetworkImage('http://b-ssl.duitang.com/uploads/item/201809/26/20180926162125_vjbwi.jpg'),),
              decoration: BoxDecoration(
                //头部组件背景设置
                color: Colors.yellow[400], //背景颜色设置
                image: DecorationImage(
                    image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567774740461&di=a674f0c60dcab972b7fbc86162fedee1&imgtype=0&src=http%3A%2F%2Ftvax4.sinaimg.cn%2Fcrop.0.0.996.996.1024%2F0067KNxbly8fet2pua6rmj30ro0ro0xo.jpg'), //背景图片
                    fit: BoxFit.cover, //填充方式（铺满容器）
                    colorFilter: ColorFilter.mode(Colors.yellow[400].withOpacity(0.6),BlendMode.hardLight) // 添加滤镜
                )
            ),
          ),
          ListTile( //抽退导航项的设置
            title: Text(
              'Message',
              textAlign: TextAlign.left,
            ),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0), // trailing文字后面显示 // leading文字前面显示
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
