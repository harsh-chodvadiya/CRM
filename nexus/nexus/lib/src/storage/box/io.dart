import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:nexus/src/constant/enum.dart';
import 'package:nexus/src/nexus.dart';
import 'package:nexus/src/utils/platform/platform.dart';
import 'package:path_provider/path_provider.dart';

import '../storage.dart';

class Box {
  Box(this.fileName, [this.path]);

  final String? path;
  final String fileName;
  RandomAccessFile? _randomAccessfile;

  final BoxValue<Map<String, dynamic>> subject =
      BoxValue<Map<String, dynamic>>(<String, dynamic>{});

  Future<void> init([Map<String, dynamic>? initialData]) async {
    subject.value = initialData ?? <String, dynamic>{};
    RandomAccessFile _file = await _getRandomFile();
    return _file.lengthSync() == 0 ? save() : _readFile();
  }

  void set(String key, dynamic value) => subject
    ..value[key] = value
    ..changeValue(key, value);

  bool containsKey(String key) => subject.value.containsKey(key);

  T? get<T>(String key) => subject.value[key] as T?;

  void remove(String key) => subject
    ..value.remove(key)
    ..changeValue(key, null);

  T keys<T>() => subject.value.keys as T;

  T values<T>() => subject.value.values as T;

  void delete() async => subject
    ..value.clear()
    ..changeValue("", null);

  Future<RandomAccessFile> _getRandomFile() async {
    if (_randomAccessfile != null) return _randomAccessfile!;
    final fileDb = await _getFile(false);
    _randomAccessfile = await fileDb.open(mode: FileMode.append);
    return _randomAccessfile!;
  }

  Future<void> save() async {
    final buffer = utf8.encode(json.encode(subject.value));
    final length = buffer.length;
    RandomAccessFile _file = await _getRandomFile();
    _randomAccessfile = await _file.lock();
    _randomAccessfile = await _randomAccessfile!.setPosition(0);
    _randomAccessfile = await _randomAccessfile!.writeFrom(buffer);
    _randomAccessfile = await _randomAccessfile!.truncate(length);
    _randomAccessfile = await _file.unlock();
    _madeBackup();
  }

  void _madeBackup() {
    _getFile(true).then(
      (value) => value.writeAsString(json.encode(subject.value), flush: true),
    );
  }

  Future<void> _readFile() async {
    try {
      RandomAccessFile file = await _getRandomFile();
      file = await file.setPosition(0);
      final buffer = Uint8List(await file.length());
      await file.readInto(buffer);
      subject.value = json.decode(utf8.decode(buffer));
    } catch (e) {
      Nexus.log('This box is corrupted. Recovering backup file...',
          logType: Log.error);
      final file = await _getFile(true);
      final content = await file.readAsString()
        ..trim();
      if (content.isEmpty) {
        subject.value = {};
      } else {
        try {
          subject.value = (json.decode(content) as Map<String, dynamic>?) ?? {};
        } catch (e) {
          Nexus.log('Can not recover corrupted box.', logType: Log.error);
          subject.value = {};
        }
      }
      await save();
    }
  }

  Future<File> _getFile(bool isBackup) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String filePath = await _getPath(isBackup, path ?? dir.path);
    final File file = File(filePath);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    return file;
  }

  Future<String> _getPath(bool isBackup, String? path) async {
    final isWindows = BoxPlatform.isWindows;
    final separator = isWindows ? '\\' : '/';
    return isBackup
        ? '$path$separator$fileName.nbb'
        : '$path$separator$fileName.nb';
  }
}
