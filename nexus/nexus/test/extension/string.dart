import 'package:flutter_test/flutter_test.dart';
import 'package:nexus/src/extension/string.dart';

Future<void> string() async {
  group('String Extensions Tests', () {
    test('capitalizeFirst', () {
      expect('hello world'.capitalizeFirst, 'Hello world');
      expect('tHIS IS A tEST'.capitalizeFirst, 'This is a test');
      expect('123abc'.capitalizeFirst, '123abc');
    });

    test('toCapitalize', () {
      expect('hello world'.toCapitalize, 'Hello World');
      expect('tHIS IS A tEST'.toCapitalize, 'This Is A Test');
      expect('123abc'.toCapitalize, '123abc');
    });

    test('toCamelCase', () {
      expect('hello world'.toCamelCase, 'helloWorld');
      expect('tHIS IS A tEST'.toCamelCase, 'thisIsATest');
      expect('123abc'.toCamelCase, '123abc');
      expect('hello   world'.toCamelCase, 'helloWorld');
    });

    test('toDate', () {
      expect('2022-01-01'.toDateTime, DateTime(2022, 1, 1));
      expect(
          '2022-01-01 12:34:56'.toDateTime, DateTime(2022, 1, 1, 12, 34, 56));
      expect(() => 'invalid date string'.toDateTime, throwsFormatException);
    });
  });
}
