import 'io.dart' if (dart.library.html) 'web.dart';

class BoxPlatform {
  static bool get isWeb => Platforms.isWeb;

  static bool get isMacOS => Platforms.isMacOS;

  static bool get isWindows => Platforms.isWindows;

  static bool get isLinux => Platforms.isLinux;

  static bool get isAndroid => Platforms.isAndroid;

  static bool get isIOS => Platforms.isIOS;

  static bool get isFuchsia => Platforms.isFuchsia;

  static bool get isMobile => BoxPlatform.isIOS || BoxPlatform.isAndroid;

  static bool get isDesktop =>
      BoxPlatform.isMacOS || BoxPlatform.isWindows || BoxPlatform.isLinux;
}
