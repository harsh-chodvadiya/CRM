part of 'utils.dart';

class Navigate {
  static Future<T?> push<T extends Object?>(
          BuildContext context, Widget widget) async =>
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget));

  static void pop<T extends Object?>(BuildContext context, [T? result]) =>
      Navigator.pop(context, result);

  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
          BuildContext context, Widget widget) async =>
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => widget));

  static Future<T?> pushAndRemoveUntil<T extends Object?>(
          BuildContext context, Widget widget) async =>
      await Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => widget), (route) => false);
}
