part of 'utils.dart';

extension StringExtension on String {
  String get fileName => split('?').first.split('/').last;
}
