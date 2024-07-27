import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

part 'locale_text.dart';

class NexusLocalization {
  NexusLocalization();

  static late Locale currentLocale;

  static Map<String, dynamic> _locale = {};
  static Map<String, Map<String, dynamic>> _translations =
      <String, Map<String, dynamic>>{};
  static List<VoidCallback> _localeUpdateCallbacks = [];

  /// Initialize localization with a given locale
  static Future<void> initialize(Locale locale) async {
    currentLocale = locale;
    String jsonString = await rootBundle.loadString(
        'assets/translations/${locale.languageCode}_${locale.countryCode}.json');
    _locale = jsonDecode(jsonString);
    _translations['${locale.languageCode}_${locale.countryCode}'] = _locale;
  }

  /// Read all files from `assets/translations` folder.
  static Future<void> readAllFiles(Iterable<Locale> locales) async {
    for (Locale locale in locales) {
      try {
        String jsonString = await rootBundle.loadString(
            'assets/translations/${locale.languageCode}_${locale.countryCode}.json');
        _translations['${locale.languageCode}_${locale.countryCode}'] =
            jsonDecode(jsonString);
      } catch (e) {}
    }
  }

  /// Change the current locale
  static void changeLocale(Locale locale) {
    if (_translations
        .containsKey('${locale.languageCode}_${locale.countryCode}')) {
      currentLocale = locale;
      _locale = _translations['${locale.languageCode}_${locale.countryCode}']!;
      for (var callback in _localeUpdateCallbacks) {
        callback.call();
      }
    }
  }

  static void _addLocaleUpdateCallback(VoidCallback callback) {
    _localeUpdateCallbacks.add(callback);
  }

  static void _removeLocaleUpdateCallback(VoidCallback callback) {
    _localeUpdateCallbacks.remove(callback);
  }
}
