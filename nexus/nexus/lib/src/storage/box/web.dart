import 'dart:async';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import '../storage.dart';

class Box {
  Box(this.boxName, [this.path]);
  html.Storage get localStorage => html.window.localStorage;

  final String? path;
  final String boxName;

  final BoxValue<Map<String, dynamic>> subject =
      BoxValue<Map<String, dynamic>>(<String, dynamic>{});

  Future<void> init([Map<String, dynamic>? initialData]) async {
    subject.value = initialData ?? <String, dynamic>{};
    if (localStorage.containsKey(boxName)) {
      await _readFromStorage();
    } else {
      await _writeToStorage(subject.value);
    }
    return;
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

  void delete() {
    localStorage.remove(boxName);
    subject.value.clear();
    subject
      ..value.clear()
      ..changeValue("", null);
  }

  Future<void> save() => _writeToStorage(subject.value);

  Future<void> _writeToStorage(Map<String, dynamic> data) async {
    localStorage.update(boxName, (val) => json.encode(subject.value),
        ifAbsent: () => json.encode(subject.value));
  }

  Future<void> _readFromStorage() async {
    final dataFromLocal =
        localStorage.entries.firstWhereOrNull((value) => value.key == boxName);
    if (dataFromLocal != null) {
      subject.value = json.decode(dataFromLocal.value) as Map<String, dynamic>;
    } else {
      await _writeToStorage(<String, dynamic>{});
    }
  }
}

extension FirstWhereExt<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
