part of 'storage.dart';

/// This callback remove the listener on addListener function
typedef Disposer = void Function();

/// replacing StateSetter, return if the Widget is mounted for extra validation.
/// if it brings overhead the extra call,
typedef NexusStateUpdate = void Function();

class NexusNotifier extends Listenable with NexusNotifierSingleMixin {}

/// A Notifier with single listeners
class NexusNotifierSingle = NexusNotifier with NexusNotifierSingleMixin;

/// This mixin add to Listenable the addListener, removerListener and
/// containsListener implementation
mixin NexusNotifierSingleMixin on Listenable {
  List<NexusStateUpdate>? _updaters = <NexusStateUpdate>[];

  @override
  Disposer _addListener(NexusStateUpdate listener) {
    assert(_debugAssertNotDisposed());
    _updaters!.add(listener);
    return () => _updaters!.remove(listener);
  }

  bool _containsListener(NexusStateUpdate listener) {
    return _updaters?.contains(listener) ?? false;
  }

  @override
  void _removeListener(VoidCallback listener) {
    assert(_debugAssertNotDisposed());
    _updaters!.remove(listener);
  }

  @protected
  void _refresh() {
    assert(_debugAssertNotDisposed());
    _notifyUpdate();
  }

  void _notifyUpdate() {
    final list = _updaters?.toList() ?? [];
    for (var element in list) {
      element();
    }
  }

  bool get _isDisposed => _updaters == null;

  bool _debugAssertNotDisposed() {
    assert(() {
      if (_isDisposed) {
        throw FlutterError('''A $runtimeType was used after being disposed.\n
'Once you have called dispose() on a $runtimeType, it can no longer be used.''');
      }
      return true;
    }());
    return true;
  }

  @mustCallSuper
  void dispose() {
    assert(_debugAssertNotDisposed());
    _updaters = null;
  }
}

class Notifier {
  Notifier._();

  static Notifier? _instance;
  static Notifier get instance => _instance ??= Notifier._();

  NotifyData? _notifyData;

  void add(VoidCallback listener) {
    _notifyData?.disposers.add(listener);
  }

  void read(NexusNotifierSingleMixin updaters) {
    final listener = _notifyData?.updater;
    if (listener != null && !updaters._containsListener(listener)) {
      updaters._addListener(listener);
      add(() => updaters._removeListener(listener));
    }
  }

  T append<T>(NotifyData data, T Function() builder) {
    _notifyData = data;
    final result = builder();
    if (data.disposers.isEmpty && data.throwException) {
      throw Error();
    }
    _notifyData = null;
    return result;
  }
}

class NotifyData {
  const NotifyData({
    required this.updater,
    required this.disposers,
    this.throwException = true,
  });
  final NexusStateUpdate updater;
  final List<VoidCallback> disposers;
  final bool throwException;
}
