part of 'utils.dart';

extension StringExtension on String {
  String get fileName => split('?').first.split('/').last;
}

extension DateTimeExtension on DateTime {
  String get dMy => DateFormat('dd MMM yy').format(this);

  String get dMY => DateFormat('dd MMM yyyy').format(this);
}
