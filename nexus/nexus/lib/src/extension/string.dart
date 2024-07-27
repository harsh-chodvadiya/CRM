extension StringExtension on String {
  /// Uppercase first letter inside string and let the others lowercase
  String get capitalizeFirst =>
      this.trim().isEmpty ? '' : this[0].toUpperCase() + substring(1);

  /// Capitalize each word inside string
  String get toCapitalize => split(' ').map((e) => e.capitalizeFirst).join(' ');

  /// Lowercase first word inside string and other words first later to uppercase and retrun one word
  String get toCamelCase => trim()
      .split(' ')
      .map((e) => e.isEmpty ? e : e.capitalizeFirst)
      .join('')
      .lowerFirst;

  String get lowerFirst => this[0].toLowerCase() + substring(1);

  /// Convert string to DateTime
  ///
  /// Examples of accepted strings:
  ///
  /// * `"2012-02-27"`
  /// * `"2012-02-27 13:27:00"`
  /// * `"2012-02-27 13:27:00.123456789z"`
  /// * `"2012-02-27 13:27:00,123456789z"`
  /// * `"20120227 13:27:00"`
  /// * `"20120227T132700"`
  /// * `"20120227"`
  /// * `"+20120227"`
  /// * `"2012-02-27T14Z"`
  /// * `"2012-02-27T14+00:00"`
  /// * `"-123450101 00:00:00 Z"`: in the year -12345.
  /// * `"2002-02-27T14:00:00-0500"`: Same as `"2002-02-27T19:00:00Z"`
  DateTime get toDateTime => DateTime.parse(this);
}
