import 'package:flutter/material.dart';
import 'package:hellow_flutter/demo/card_demo.dart';
import 'package:hellow_flutter/demo/form_demo.dart';
import 'package:hellow_flutter/demo/radio_demo.dart';
import 'package:hellow_flutter/demo/slider_demo.dart';
import 'package:hellow_flutter/demo/switch_demo.dart';
import './button_demo.dart';
import './floating_action_button_demo.dart';
import './popup_menu_button_demo.dart';
import './checkbox_demo.dart';
import './datetime_demo.dart';
import './simple_dialog_demo.dart';
import './alert_dialog_demo.dart';
import './bottom_sheet_demo.dart';
import './snack_bar_demo.dart';
import './expandsion_panel_demo.dart';
import './chip_demo.dart';
import './data_table_demo.dart';
import './paginated_data_table_demo.dart';
import './stepper_demo.dart';

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
            title: 'StepperDemo',
            page: StepperDemo(),
          ),
          ListItem(
            title: 'CardDemo',
            page: CardDemo(),
          ),
          ListItem(
            title: 'PaginatedDataTableDemo',
            page: PaginatedDataTableDemo(),
          ),
          ListItem(
            title: 'DataTableDemo',
            page: DataTableDemo(),
          ),
          ListItem(
            title: 'ChipDemo',
            page: ChipDemo(),
          ),
          ListItem(
            title: 'ExpansionPanelDemo',
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: 'SnackBarDemo',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: 'BottomSheetDemo',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'AlertDialogDemo',
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: 'SimpleDialogDemo',
            page: SimpleDialogDemo(),
          ),
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
