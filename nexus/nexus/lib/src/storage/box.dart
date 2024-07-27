part of 'storage.dart';

class NexusBox {
  static final Map<String, NexusBox> _boxes = {};
  late Box _box;
  late Future<bool> _isCreated;

  factory NexusBox([String boxName = 'NexusBox']) {
    if (_boxes.containsKey(boxName)) {
      return _boxes[boxName]!;
    } else {
      final instance = NexusBox._(boxName);
      _boxes[boxName] = instance;
      return instance;
    }
  }

  NexusBox._(String boxName) {
    _box = Box(boxName);
    _isCreated = Future<bool>(() async {
      try {
        await _box.init();
      } catch (err) {
        rethrow;
      }
      return true;
    });
  }

  /// Initialize a NexusBox with the given box name.
  static Future<bool> initialize([String boxName = 'NexusBox']) async =>
      await NexusBox(boxName)._isCreated;

  static Future<NexusBox> open([String boxName = 'NexusBox']) async {
    if (_boxes.containsKey(boxName)) {
      return _boxes[boxName]!;
    } else {
      final instance = NexusBox._(boxName);
      _boxes[boxName] = instance;
      return instance;
    }
  }

  /// Write data to the NexusBox.
  Future<void> set(String key, dynamic value) async {
    _box.set(key, value);
    return _save();
  }

  /// Check if a given key exists in the NexusBox.
  bool containsKey(String key) => _box.containsKey(key);

  /// Read a value from the NexusBox with the given key.
  T? get<T>(String key) => _box.get(key);

  /// Remove data from the NexusBox by key.
  Future<void> remove(String key) async {
    _box.remove(key);
    return _save();
  }

  /// Returns a [ValueListenable] which notifies its listeners
  /// when an entry in the box changes.
  ValueListenable<NexusBox> listenable() => BoxListenable(this);

  /// Add a listener to observe changes in the NexusBox.
  VoidCallback listen(VoidCallback value) => _box.subject._addListener(value);

  /// Retrieve all keys from the NexusBox.
  T keys<T>() => _box.keys();

  /// Retrieve all values from the NexusBox.
  T values<T>() => _box.values();

  /// Delete all data in the NexusBox.
  Future<void> delete() async {
    _box.delete();
    return _save();
  }

  final Microtask _microtask = Microtask();
  final NexusQueue _queue = NexusQueue();

  Future<void> _save() async {
    return _microtask.exec(
      () async => await _queue.add(() async {
        try {
          await _box.save();
        } catch (e) {
          rethrow;
        }
        return;
      }),
    );
  }
}

class BoxListenable<B extends NexusBox> extends ValueListenable<B> {
  final B box;
  final List<VoidCallback> _listeners = [];

  BoxListenable(this.box);

  @override
  void addListener(VoidCallback listener) {
    if (_listeners.isEmpty) {
      box.listen(() {
        for (var listener in _listeners) {
          listener();
        }
      });
    }
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) => _listeners.remove(listener);

  @override
  B get value => box;
}
