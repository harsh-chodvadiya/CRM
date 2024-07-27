part of 'constant.dart';

class Themes {
  Themes._();

  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: Palette.textBlue,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarBrightness:
          //     Platform.isIOS ? Brightness.light : Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Palette.transparent,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: 3,
        errorStyle: TextStyle(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w500,
          color: Palette.red,
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 14.0.r, vertical: 14.0.r),
        isDense: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.textBlue,
          foregroundColor: Palette.white,
          padding: EdgeInsets.symmetric(vertical: 16.0.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0.r),
          ),
          textStyle: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorSchemeSeed: Palette.textBlue,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarBrightness:
          //     Platform.isIOS ? Brightness.dark : Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Palette.transparent,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorMaxLines: 3,
        errorStyle: TextStyle(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w500,
          color: Palette.red,
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 14.0.r, vertical: 14.0.r),
        isDense: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.textBlue,
          foregroundColor: Palette.white,
          padding: EdgeInsets.symmetric(vertical: 16.0.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0.r),
          ),
          textStyle: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
