part of 'storage.dart';

abstract class Listenable {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const Listenable();

  /// Return a [Listenable] that triggers when any of the given [Listenable]s
  /// themselves trigger.
  ///
  /// The list must not be changed after this method has been called. Doing so
  /// will lead to memory leaks or exceptions.
  ///
  /// The list may contain nulls; they are ignored.
  factory Listenable.merge(List<Listenable?> listenables) = _MergingListenable;

  /// Register a closure to be called when the object notifies its listeners.
  void _addListener(VoidCallback listener);

  /// Remove a previously registered closure from the list of closures that the
  /// object notifies.
  void _removeListener(VoidCallback listener);
}

class _MergingListenable extends Listenable {
  _MergingListenable(this._children);

  final List<Listenable?> _children;

  @override
  void _addListener(VoidCallback listener) {
    for (final Listenable? child in _children) {
      child?._addListener(listener);
    }
  }

  @override
  void _removeListener(VoidCallback listener) {
    for (final Listenable? child in _children) {
      child?._removeListener(listener);
    }
  }

  @override
  String toString() {
    return 'Listenable.merge([${_children.join(", ")}])';
  }
}
