part of 'utils.dart';

class Storage {
  static const String isDark = 'is_dark';
  static const String locale = 'locale';

  static late NexusBox nexusBox;

  ///
  /// Initialize a NexusBox with the given box name.
  /// Call this function in main file.
  ///
  static Future<void> initialize() async {
    await NexusBox.initialize();
    nexusBox = NexusBox('NexusBox');
  }

  ///
  /// Read a value from the NexusBox with the given key.
  ///
  static T? get<T>(String key) => nexusBox.get(key);

  ///
  /// Write data to the NexusBox.
  ///
  static Future<void> set(String key, dynamic value) async =>
      await nexusBox.set(key, value);

  ///
  /// Check if a given key exists in the NexusBox.
  ///
  static bool isContainKey(String key) => nexusBox.containsKey(key);

  ///
  /// Remove data from the NexusBox by key.
  ///
  static Future<void> remove(String key) => nexusBox.remove(key);

  ///
  /// Delete all data in the NexusBox.
  ///
  static Future<void> delete() => nexusBox.delete();

  ///
  /// Call this function in logout button.
  /// Make sure this function call after other functions.
  ///
  static Future<void> logout() async {
    await remove(Storage.isDark);
  }

  ///
  /// Returns a [ValueListenable] which notifies its listeners
  /// when an entry in the box changes.
  ///
  static ValueListenable<NexusBox> listen() => nexusBox.listenable();
}
