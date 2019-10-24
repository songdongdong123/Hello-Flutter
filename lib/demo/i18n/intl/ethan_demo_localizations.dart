import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'ethan_demo_messages_all.dart';

class EthanoDemoLocalizations {
 static EthanoDemoLocalizations of(BuildContext context) {
    return Localizations.of<EthanoDemoLocalizations>(
      context,
      EthanoDemoLocalizations
    );
  }

  static Future<EthanoDemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return EthanoDemoLocalizations();
    });
  }
  
  String get title => Intl.message(
    'hello',
    name: 'title',
    desc: 'demo localizations.',
  );

  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'greet someone.',
    args: [name],
  );
}

class EthanoDemoLocalizationsDelegate
    extends LocalizationsDelegate<EthanoDemoLocalizations> {
  EthanoDemoLocalizationsDelegate();

  @override
  Future<EthanoDemoLocalizations> load(Locale locale) {
    return EthanoDemoLocalizations.load(locale);
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<EthanoDemoLocalizations> old) {
    return false;
  }
}