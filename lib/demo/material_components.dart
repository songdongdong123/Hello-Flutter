import 'package:flutter/material.dart';
import 'package:hellow_flutter/demo/form_demo.dart';
import 'package:hellow_flutter/demo/radio_demo.dart';
import 'package:hellow_flutter/demo/slider_demo.dart';
import 'package:hellow_flutter/demo/switch_demo.dart';
import './button_demo.dart';
import './floating_action_button_demo.dart';
import './popup_menu_button_demo.dart';
import './checkbox_demo.dart';
import './datetime_demo.dart';

class MeterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MeterialComnponents'),
        elevation: 0.0,
      ),
      body: ListView(
        // ListView列表视图
        children: <Widget>[
          ListItem(
            title: 'DatetimeDemo',
            page: DatetimeDemo(),
          ),
          ListItem(
            title: 'SliderDemo',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'SwitchDemo',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'Radio',
            page: RadioDemo(),
          ),
          ListItem(
            title: 'Checkbox',
            page: CheckboxDemo(),
          ),
          ListItem(
            title: 'Form',
            page: FormDemo(),
          ),
          ListItem(
            title: 'PopupMenuButton',
            page: PopupMenuButtonDemo(),
          ),
           ListItem(
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
        ],
      ),
    );
  }
}



class _WidgetDemo extends StatelessWidget {
  // buttondemo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //basic_demo.dart
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}



class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  ListItem({this.title, this.page});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
