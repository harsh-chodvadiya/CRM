import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fixedSize,
    this.padding,
  });

  final String text;
  final void Function()? onPressed;
  final Size? fixedSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: padding, fixedSize: fixedSize),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
