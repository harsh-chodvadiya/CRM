import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crm/src/constant/constant.dart';

import 'input_formatter.dart';

export 'input_formatter.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({
    super.key,
    this.controller,
    this.hintText,
    this.helperText,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.maxLines,
    this.borderRadius,
    this.onTap,
    this.readOnly = false,
    this.suffix,
    this.textAlign = TextAlign.left,
    this.filled,
    this.fillColor,
    this.prefix,
    this.onChanged,
    this.onEditingComplete,
    this.focusNode,
    this.obscureText = false,
    this.suffixHeight,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? helperText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? validator;
  final int? maxLines;
  final double? borderRadius;
  final void Function()? onTap;
  final bool readOnly;
  final Widget? suffix;
  final TextAlign textAlign;
  final bool? filled;
  final Color? fillColor;
  final Widget? prefix;
  final void Function(String value)? onChanged;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final bool obscureText;
  final double? suffixHeight;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      inputFormatters: [NoSpaceFormatter(), ...inputFormatters ?? []],
      maxLines: maxLines,
      textAlign: textAlign,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        hintText: hintText,
        helperText: helperText,
        errorStyle: const TextStyle(
          fontSize: 12, // Adjust the size of the error message text
          color: Colors.red, // Customize the color if needed
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Palette.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Palette.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Palette.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Palette.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Palette.red),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: suffix,
        ),
        suffixIconConstraints: BoxConstraints(maxHeight: suffixHeight ?? 23.0),
        prefixIcon: prefix,
        prefixIconConstraints: const BoxConstraints(maxWidth: 60.0),
      ),
      readOnly: readOnly,
      onTap: onTap,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
    );
  }
}
