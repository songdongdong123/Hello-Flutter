import 'package:flutter/material.dart';

import './intl/ethan_demo_localizations.dart';
// import 'package:hellow_flutter/demo/i18n/intl/ethan_demo_localizations.dart';
// import './map/ethan_demo_localizations.dart';


class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale local = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(local.toString()),
            Text(
              // Localizations.of(context, EthanoDemoLocalizations).title,
              EthanoDemoLocalizations.of(context).title,
              // EthanoDemoLocalizations.of(context).greet('ethan'),
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}