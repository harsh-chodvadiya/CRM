import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Similar to [MediaQuery.of(context).size]
  Size get size => MediaQuery.of(this).size;

  /// Similar to [MediaQuery.of(context).size.height]
  double get height => MediaQuery.of(this).size.height;

  /// Similar to [MediaQuery.of(context).size.width]
  double get width => MediaQuery.of(this).size.width;

  /// Similar to [Theme.of(context)]
  ThemeData get theme => Theme.of(this);

  /// Similar to [Theme.of(context).colorScheme]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
