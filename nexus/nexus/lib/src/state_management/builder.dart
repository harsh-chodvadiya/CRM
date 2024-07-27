part of 'controller.dart';

class NexusBuilder<NS> extends StatefulWidget {
  const NexusBuilder({
    super.key,
    required this.bloc,
    required this.builder,
  });

  final NexusController<NS> bloc;
  final Widget Function(NS state) builder;

  @override
  State<NexusBuilder<NS>> createState() => _NexusBuilderState<NS>();
}

class _NexusBuilderState<NS> extends State<NexusBuilder<NS>> {
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

  void _update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return widget.builder(widget.bloc._stateValue);
  }
}
