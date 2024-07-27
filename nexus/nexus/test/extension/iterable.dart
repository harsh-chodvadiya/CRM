import 'package:flutter_test/flutter_test.dart';
import 'package:nexus/src/extension/iterable.dart';

Future<void> iterable() async {
  group('Iterable Extensions Tests', () {
    test('groupBy', () {
      final list = [
        {'key': 'A', 'value': 1},
        {'key': 'B', 'value': 2},
        {'key': 'A', 'value': 3},
        {'key': 'B', 'value': 4},
      ];

      final grouped = list.groupBy((element) => element['key']);
      expect(grouped['A'], [
        {'key': 'A', 'value': 1},
        {'key': 'A', 'value': 3},
      ]);
      expect(grouped['B'], [
        {'key': 'B', 'value': 2},
        {'key': 'B', 'value': 4},
      ]);
    });
  });
}
