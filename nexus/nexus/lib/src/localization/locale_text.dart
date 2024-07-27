part of 'localization.dart';

class LocaleText extends StatefulWidget {
  const LocaleText({
    Key? key,
    required this.dataKey,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : super(key: key);

  final String dataKey;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  @override
  _LocaleTextState createState() => _LocaleTextState();
}

class _LocaleTextState extends State<LocaleText> {
  VoidCallback? _callback;

  @override
  void initState() {
    super.initState();
    _callback = () => setState(() {});
    NexusLocalization._addLocaleUpdateCallback(_callback!);
  }

  @override
  void dispose() {
    NexusLocalization._removeLocaleUpdateCallback(_callback!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${NexusLocalization._locale['${widget.dataKey}']}',
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      textScaler: widget.textScaler,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      textWidthBasis: widget.textWidthBasis,
      textHeightBehavior: widget.textHeightBehavior,
      selectionColor: widget.selectionColor,
    );
  }
}
