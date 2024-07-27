import 'package:flutter/widgets.dart';

part 'builder.dart';
part 'listener.dart';
part 'consumer.dart';

abstract class NexusController<NS> extends ChangeNotifier {
  NexusController(this._state);
  NS _state;
  NS get _stateValue => _state;

  void update(NS state) {
    _state = state;
    notifyListeners();
  }
}
