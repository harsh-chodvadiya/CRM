class RegExps {
  RegExps._();

  ///
  /// Username Regexp
  ///
  /// Allowed to Alphabet, number, underscore ("_") characters
  ///
  static RegExp username1 = RegExp(r'^[a-zA-Z0-9_]+$');

  ///
  /// Username Regexp
  ///
  /// Minimum 3 character
  /// Allowed to use underscore ("_") and period (".") characters in middle of name
  /// Can't start or end with period (".")
  /// Can't have consecutive period (.).
  ///
  static RegExp username2 =
      RegExp(r'^[a-zA-Z0-9_](?!.*[.]{2})[a-zA-Z0-9_\.]*[a-zA-Z0-9_]{3,}$');

  ///
  /// Username Regexp
  ///
  /// Minimum 3 characters
  /// Allowed to use aplhanumeric, underscore ("_"), dash ("-"), and period (".") characters.
  /// Symbols can only be used in the middle of name.
  /// Can't start or end with period (".", "-")
  /// Can't have consecutive period (".", "-")
  ///
  static RegExp username3 = RegExp(
      r'^[a-zA-Z0-9_](?!.*[.]{2})(?!.*[-]{2})[a-zA-Z0-9_\-\.]*[a-zA-Z0-9_]{3,}$');

  // /// Phone Number Regexp
  // ///
  // /// Must be started either with "0", "+", "+XX <X between 2 to 4 digit>", or "(+XX <X between 2 to 3 digit>)"
  // /// It is possible to add whitespace separating digit with "+" or "(+XX)"
  // ///
  // // static RegExp phoneNumber = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  // // static RegExp phoneNumber = RegExp(r'^(0|\+|(\+[0-9]{2,4}|\(\+?[0-9]{2,4}\)) ?)([0-9]*|\d{2,4}-\d{2,4}(-\d{2,4})?)$');
  // static RegExp phoneNumber =
  //     RegExp(r'^\+?([0-9]{2,3})\)?[- ]?([0-9]{2,3})[- ]?([0-9]{4})$');

  ///
  /// Passport No. Regexp
  ///
  // static RegExp passportNo = RegExp(r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');
  static RegExp passportNo = RegExp(r'^[A-Z]{2}\d{7}$');

  ///
  /// Numeric Only Regexp
  ///
  /// Doesn't accepting "." which have double data type
  ///
  static RegExp numericOnly = RegExp(r'^[0-9]+$');

  ///
  /// Alphabet Only Regexp
  ///
  /// Doesn't accepting whitespace
  ///
  static RegExp alphabetOnly = RegExp(r'^[a-zA-Z]+$');

  ///
  /// Alphabet & Numeric Only Regexp
  ///
  /// Doesn't accepting whitespace
  ///
  static RegExp alphabetNumericOnly = RegExp(r'^[a-zA-Z0-9]+$');

  ///
  /// Password (Easy) Regexp
  ///
  /// No whitespace allowed
  /// Minimum characters: 8
  ///
  static RegExp passwordEasy = RegExp(r'^\S{8,}$');

  ///
  /// Password (Normal) Regexp
  ///
  /// No whitespace allowed
  /// Must contains at least: 1 letter & 1 number
  /// Minimum characters: 8
  ///
  static RegExp passwordMedium = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)\S{8,}$');

  ///
  /// Password (Hard) Regexp
  ///
  /// No whitespace allowed
  /// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
  /// Minimum characters: 8
  ///
  // static RegExp passwordHard = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{8,}$');
  static RegExp passwordHard =
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^\w\s])\S{8,}$');

  ///
  /// URL Regexp
  ///
  static RegExp url = RegExp(
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$");

  ///
  /// Email Regexp
  ///
  static RegExp email = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Checks if string is DateTime (UTC or Iso8601).
  // r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$'

  /// Checks if string is hexadecimal.
  // r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'
}
