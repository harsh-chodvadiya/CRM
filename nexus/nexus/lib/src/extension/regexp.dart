import 'package:nexus/src/constant/regexp.dart';

extension RegExpExtension on String {
  /// Username Regexp
  ///
  /// Allowed to Alphabet, number, underscore ("_") characters
  ///
  bool get isUserName1 => RegExps.username1.hasMatch(this);

  /// Username Regexp
  ///
  /// Minimum 3 character
  /// Allowed to use underscore ("_") and period (".") characters in middle of name
  /// Can't start or end with period (".")
  /// Can't have consecutive period (.).
  ///
  bool get isUserName2 => RegExps.username2.hasMatch(this);

  /// Username Regexp
  ///
  /// Minimum 3 characters
  /// Allowed to use aplhanumeric, underscore ("_"), dash ("-"), and period (".") characters.
  /// Symbols can only be used in the middle of name.
  /// Can't start or end with period (".", "-")
  /// Can't have consecutive period (".", "-")
  ///
  bool get isUserName3 => RegExps.username3.hasMatch(this);

  // /// Phone Number Regexp
  // ///
  // /// Must be started either with "0", "+", "+XX <X between 2 to 4 digit>", or "(+XX <X between 2 to 3 digit>)"
  // /// It is possible to add whitespace separating digit with "+" or "(+XX)"
  // ///
  // // static RegExp phoneNumber = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  // // static RegExp phoneNumber = RegExp(r'^(0|\+|(\+[0-9]{2,4}|\(\+?[0-9]{2,4}\)) ?)([0-9]*|\d{2,4}-\d{2,4}(-\d{2,4})?)$');
  // bool get isPhoneNumber => RegExps.phoneNumber.hasMatch(this);

  /// Passport No. Regexp
  ///
  bool get isPassportNo => RegExps.passportNo.hasMatch(this);

  /// Numeric Only Regexp
  ///
  /// Doesn't accepting "." which have double data type
  ///
  bool get isNumeric => RegExps.numericOnly.hasMatch(this);

  /// Alphabet Only Regexp
  ///
  /// Doesn't accepting whitespace
  ///
  bool get isAlphabet => RegExps.alphabetOnly.hasMatch(this);

  /// Alphabet & Numeric Only Regexp
  ///
  /// Doesn't accepting whitespace
  ///
  bool get isAlphaNumeric => RegExps.alphabetNumericOnly.hasMatch(this);

  /// Password (Easy) Regexp
  ///
  /// No whitespace allowed
  /// Minimum characters: 8
  ///
  bool get isPasswordEasy => RegExps.passwordEasy.hasMatch(this);

  /// Password (Medium) Regexp
  ///
  /// No whitespace allowed
  /// Must contains at least: 1 letter & 1 number
  /// Minimum characters: 8
  ///
  bool get isPasswordMedium => RegExps.passwordMedium.hasMatch(this);

  /// Password (Hard) Regexp
  ///
  /// No whitespace allowed
  /// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
  /// Minimum characters: 8
  ///
  bool get isPasswordHard => RegExps.passwordHard.hasMatch(this);

  /// URL Regexp
  ///
  bool get isUrl => RegExps.url.hasMatch(this);

  /// Email Regexp
  ///
  bool get isEmail => RegExps.email.hasMatch(this);
}
