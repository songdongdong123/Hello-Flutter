import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class EthanoDemoLocalizations {
  final Locale locale;

  EthanoDemoLocalizations(this.locale);

  static EthanoDemoLocalizations of(BuildContext context) {
    return Localizations.of<EthanoDemoLocalizations>(
      context,
      EthanoDemoLocalizations
    );
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class EthanoDemoLocalizationsDelegate
    extends LocalizationsDelegate<EthanoDemoLocalizations> {
  EthanoDemoLocalizationsDelegate();

  @override
  Future<EthanoDemoLocalizations> load(Locale locale) {
    return SynchronousFuture<EthanoDemoLocalizations>(
        EthanoDemoLocalizations(locale));
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