import 'package:flutter_test/flutter_test.dart';
import 'package:nexus/src/constant/regexp.dart';

Future<void> regexp() async {
  group('RegExp Tests', () {
    test('Username1 RegExp Test', () {
      expect('username123', matches(RegExps.username1));
      expect('user_name', matches(RegExps.username1));
      expect('123', matches(RegExps.username1));
      expect('_username', matches(RegExps.username1));
      expect('username_', matches(RegExps.username1));
      expect('username__', matches(RegExps.username1));
      expect('user-name', isNot(matches(RegExps.username1)));
    });

    test('Username2 RegExp Test', () {
      expect('user_name', matches(RegExps.username2));
      expect('user__name', matches(RegExps.username2));
      expect('user.name', matches(RegExps.username2));
      expect('user._.name', matches(RegExps.username2));
      expect('123user', matches(RegExps.username2));
      expect('us', isNot(matches(RegExps.username2)));
      expect('user..name', isNot(matches(RegExps.username2)));
      expect('.user', isNot(matches(RegExps.username2)));
    });

    test('Username3 RegExp Test', () {
      expect('user_name', matches(RegExps.username3));
      expect('user__name', matches(RegExps.username3));
      expect('user-name', matches(RegExps.username3));
      expect('user.-.name', matches(RegExps.username3));
      expect('123user', matches(RegExps.username3));
      expect('us', isNot(matches(RegExps.username3)));
      expect('user--name', isNot(matches(RegExps.username3)));
      expect('user-', isNot(matches(RegExps.username3)));
    });

    // test('Phone Number RegExp Test', () {
    //   expect('+1234567890', matches(RegExps.phoneNumber));
    //   expect('(123) 456-7890', matches(RegExps.phoneNumber));
    //   expect('123-456-7890', matches(RegExps.phoneNumber));
    //   expect('12-34-5678', isNot(matches(RegExps.phoneNumber)));
    // });

    test('Passport No. RegExp Test', () {
      expect('AB1234567', matches(RegExps.passportNo));
      expect('123456789', isNot(matches(RegExps.passportNo)));
    });

    test('Numeric Only RegExp Test', () {
      expect('12345', matches(RegExps.numericOnly));
      expect('12.34', isNot(matches(RegExps.numericOnly)));
    });

    test('Alphabet Only RegExp Test', () {
      expect('abcXYZ', matches(RegExps.alphabetOnly));
      expect('abc XYZ', isNot(matches(RegExps.alphabetOnly)));
    });

    test('Alphabet Numeric Only RegExp Test', () {
      expect('abc123', matches(RegExps.alphabetNumericOnly));
      expect('abc 123', isNot(matches(RegExps.alphabetNumericOnly)));
    });

    test('Password Easy RegExp Test', () {
      expect('password1', matches(RegExps.passwordEasy));
      expect('short', isNot(matches(RegExps.passwordEasy)));
    });

    test('Password Medium RegExp Test', () {
      expect('Password1', matches(RegExps.passwordMedium));
      expect('NoNumber', isNot(matches(RegExps.passwordMedium)));
    });

    test('Password Hard RegExp Test', () {
      expect('P@ssw0rd', matches(RegExps.passwordHard));
      expect('weakpassword', isNot(matches(RegExps.passwordHard)));
    });

    test('URL RegExp Test', () {
      expect('https://example.com', matches(RegExps.url));
      expect('www.example.com', matches(RegExps.url));
      expect('invalid-url', isNot(matches(RegExps.url)));
    });

    test('Email RegExp Test', () {
      expect('user@example.com', matches(RegExps.email));
      expect('invalid_email', isNot(matches(RegExps.email)));
    });
  });
}
