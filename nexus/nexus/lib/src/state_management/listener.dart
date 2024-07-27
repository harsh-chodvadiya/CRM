part of 'controller.dart';

class NexusListener<NS> extends StatefulWidget {
  const NexusListener({
    super.key,
    required this.bloc,
    required this.listener,
    required this.child,
  });

  final NexusController<NS> bloc;
  final void Function(NS state) listener;
  final Widget child;

  @override
  State<NexusListener<NS>> createState() => _NexusListenerState<NS>();
}

class _NexusListenerState<NS> extends State<NexusListener<NS>> {
  @override
  void initState() {
    super.initState();
    widget.bloc.addListener(_update);
  }

  @override
  void dispose() {
    widget.bloc.removeListener(_update);
    super.dispose();
  }

  void _update() => widget.listener(widget.bloc._stateValue);

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
