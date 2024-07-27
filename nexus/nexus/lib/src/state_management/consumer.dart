part of 'controller.dart';

class NexusConsumer<NS> extends StatefulWidget {
  const NexusConsumer({
    super.key,
    required this.bloc,
    required this.builder,
    required this.listener,
  });

  final NexusController<NS> bloc;
  final Widget Function(NS state) builder;
  final void Function(NS state) listener;

  @override
  State<NexusConsumer<NS>> createState() => _NexusConsumerState<NS>();
}

class _NexusConsumerState<NS> extends State<NexusConsumer<NS>> {
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

  void _update() {
    widget.listener(widget.bloc._stateValue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(widget.bloc._stateValue);
  }
}
