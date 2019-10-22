import 'package:flutter/material.dart';
class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon'
  ];
  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //basic_demo.dart
          children: <Widget>[
            Wrap( // 自动换行，可设置行间距，和列间距
              spacing: 16.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip( //基础用法
                  label: Text('Life'),
                ),
                Chip( // 带背景颜色
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip( // 带左侧描述的chip
                  label: Text('Ethan'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('冬'),
                  ),
                ),
                Chip( // 带图片的chip
                  label: Text('Ethan'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://avatars0.githubusercontent.com/u/20263883?s=460&v=4'
                    ),
                    child: Text('冬'),
                  ),
                ),
                Chip(
                  // 带删除功能的chip
                  label: Text('City'),
                  onDeleted: () {
                    print('删除');
                  }, // 删除动作的函数
                  deleteIcon: Icon(Icons.delete), // 图标
                  deleteIconColor: Colors.redAccent, // 图标的颜色
                  deleteButtonTooltipMessage: '删除这个tag',// 长按图标的文字提示
                ),
                Divider( // 分割线
                  color: Colors.grey, // 分割线颜色
                  height: 32.0, // 分割线高度
                  // indent: 32.0, //分割线缩进
                ),
                Wrap(
                  // 生成一组chip
                  spacing: 8.0,
                  children: _tags.map((tag) { //迭代生成chip
                    return Chip(
                      label: Text(tag),
                      onDeleted: () { // 添加删除操作
                        // 这里注意，使用的是StatefulWidget
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider( // 分割线
                  color: Colors.grey, // 分割线颜色
                  height: 32.0, // 分割线高度
                  // indent: 32.0, //分割线缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap(
                  // 生成一组ActionChip(一组操作chip)
                  spacing: 8.0,
                  children: _tags.map((tag) { //迭代生成chip
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag; 
                        });
                      }, // ActionChip不能使用onDeleted
                    );
                  }).toList(),
                ),
                Divider( // 分割线
                  color: Colors.grey, // 分割线颜色
                  height: 32.0, // 分割线高度
                  // indent: 32.0, //分割线缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: ${_selected.toString()}'),
                ),
                Wrap(
                  // 生成一组ActionChip(一组操作chip)
                  spacing: 8.0,
                  children: _tags.map((tag) { //迭代生成chip
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider( // 分割线
                  color: Colors.grey, // 分割线颜色
                  height: 32.0, // 分割线高度
                  // indent: 32.0, //分割线缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_choice'),
                ),
                Wrap(
                  // 生成一组ActionChip(一组操作chip)
                  spacing: 8.0,
                  children: _tags.map((tag) { //迭代生成chip
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      selectedColor: Colors.black,
                      onSelected: (value) {
                        setState(() {
                         _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( //重置一组chip
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon'
            ]; 

            _selected = [];

            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}