import 'package:flutter/material.dart';
import 'package:nexus/nexus.dart';

import 'app/root.dart';
import 'constant/enum.dart';
import 'localization/localization.dart';
import 'utils/debouncer.dart';
import 'utils/logger.dart';

class Nexus {
  const Nexus._();

  @protected
  static NexusRootState get _controller => NexusRootState.controller;

  @protected
  static BuildContext? get _context => _controller.key.currentContext;

  /// Gives you the current theme
  static ThemeData get theme {
    if (_context != null) {
      return Theme.of(_context!);
    }
    return ThemeData.fallback();
  }

  /// Check if the current theme is dark mode
  static bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Change the theme
  static void changeTheme(ThemeData theme) {
    _controller.setTheme(theme);
  }

  /// Change the theme mode
  static void changeThemeMode(ThemeMode themeMode) {
    _controller.setThemeMode(themeMode);
  }

  /// Initialize localization with a given locale
  static Future<void> initLocale(Locale locale) async {
    await NexusLocalization.initialize(locale);
  }

  /// Change the current locale
  static Locale get locale => NexusLocalization.currentLocale;

  /// Change the current locale
  static void changeLocale(Locale locale) {
    NexusLocalization.changeLocale(locale);
  }

  /// Emit a log event.
  ///
  /// This function was designed to map closely to the logging information
  ///
  /// - [message] is the log message
  /// - [logType] is the log type which give color to the log message
  /// - [className] (optional) is the name of the source of the log message
  static void log(
    String message, {
    Log? logType,
    String className = '',
  }) =>
      Logger.logger(message, logType: logType, className: className);

  static Future<void> debounce(VoidCallback action) async =>
      await Debouncer.call(action);
}
