import 'dart:async';

class Microtask {
  int _version = 0;
  int _microtask = 0;

  void exec(Function callback) {
    if (_microtask == _version) {
      _microtask++;
      scheduleMicrotask(() {
        _version++;
        _microtask = _version;
        callback();
      });
    }
  }
}

class NexusQueue {
  final List<_Item> _queue = [];
  bool _active = false;

  Future<T> add<T>(Function job) async {
    Completer<T> completer = Completer<T>();
    _queue.add(_Item(completer, job));
    await _check();
    return completer.future;
  }

  Future<void> _check() async {
    if (!_active && _queue.isNotEmpty) {
      _active = true;
      var item = _queue.removeAt(0);
      try {
        item.completer.complete(await item.job());
      } on Exception catch (e) {
        item.completer.completeError(e);
      }
      _active = false;
      _check();
    }
  }
}

class _Item {
  final Completer completer;
  final Function job;

  _Item(this.completer, this.job);
}
