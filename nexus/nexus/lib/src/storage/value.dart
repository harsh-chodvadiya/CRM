part of 'storage.dart';

class BoxValue<T> extends Value<T> {
  BoxValue(super.value);

  void changeValue(String key, dynamic value) => _refresh();
}

mixin StateMixin<T> on NexusNotifier {
  T? _value;

  T get value => _value as T;

  set value(T newValue) {
    if (_value == newValue) return;
    _value = newValue;
    _refresh();
  }
}

class Value<T> extends NexusNotifier with StateMixin<T> {
  Value(T val) {
    _value = val;
  }
}
