import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexus/nexus.dart';
import 'package:path_provider/path_provider.dart';

import 'list_equality.dart';

Future<void> storage() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late NexusBox nexusBox;

  const channel = MethodChannel('plugins.flutter.io/path_provider');
  void setUpMockChannels(MethodChannel channel) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall? methodCall) async {
        if (methodCall?.method == 'getApplicationDocumentsDirectory') {
          return '.';
        }
        return null;
      },
    );
  }

  setUpAll(() async {
    setUpMockChannels(channel);
  });

  setUp(() async {
    await NexusBox.initialize();
    nexusBox = NexusBox();
    await nexusBox.delete();
  });

  test('set and get', () {
    var list = new List<int>.generate(50, (i) {
      int count = i + 1;
      nexusBox.set('list', count);
      return count;
    });

    expect(list.last, nexusBox.get('list'));
  });

  test('Test backup and recover file', () async {
    await nexusBox.set('name', 'nexus');
    expect('nexus', nexusBox.get('name'));

    final file = await _fileDb();
    file.writeAsStringSync('ndj323e');
    await NexusBox.initialize();

    expect('nexus', nexusBox.get('name'));
  });

  test('set, get, remove and key exist', () {
    expect(false, nexusBox.containsKey('integer'));
    expect(null, nexusBox.get('integer'));

    var list = new List<int>.generate(50, (i) {
      int count = i + 1;
      nexusBox.set('integer', count);
      return count;
    });
    expect(true, nexusBox.containsKey('integer'));
    expect(list.last, nexusBox.get('integer'));
    nexusBox.remove('integer');

    expect(null, nexusBox.get('integer'));
  });

  test('FreshBox', () async {
    final box1 = await NexusBox.initialize('box');
    await NexusBox.initialize('FreshBox');
    final freshBox = NexusBox('FreshBox');

    var box2 = await NexusBox.initialize();
    expect(box1 == box2, true);

    freshBox.set('test', '1234');
    nexusBox.set('test', 'a');
    expect(nexusBox.get('test') == freshBox.get('test'), false);
  });

  group('get keys/values', () {
    Function(Iterable, List) eq =
        (i, l) => const ListEquality().equals(i.toList(), l);

    test('should return their values', () {
      expect(eq(nexusBox.keys().toList(), []), true);
      expect(eq(nexusBox.values().toList(), []), true);

      nexusBox.set('key1', 1);
      expect(eq(nexusBox.keys(), ['key1']), true);
      expect(eq(nexusBox.values(), [1]), true);

      nexusBox.set('key2', 'a');
      expect(eq(nexusBox.keys(), ['key1', 'key2']), true);
      expect(eq(nexusBox.values(), [1, 'a']), true);

      nexusBox.set('key3', 3.0);
      expect(eq(nexusBox.keys(), ['key1', 'key2', 'key3']), true);
      expect(eq(nexusBox.values(), [1, 'a', 3.0]), true);
    });
  });
}

Future<File> _fileDb(
    {bool isBackup = false, String fileName = 'NexusBox'}) async {
  final dir = await getApplicationDocumentsDirectory();
  final _path = dir.path;
  final _file =
      isBackup ? File('$_path/$fileName.nbb') : File('$_path/$fileName.nb');
  return _file;
}
