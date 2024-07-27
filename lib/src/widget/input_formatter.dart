export 'package:flutter/services.dart'
    show LengthLimitingTextInputFormatter, FilteringTextInputFormatter;

import 'package:flutter/services.dart';

class NoSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();
      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }
    return newValue;
  }
}

class PriceTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;

    String cleanedText = newValue.text.replaceAll(',', '');
    final formattedValue = _formatAsPrice(cleanedText);

    // Calculate cursor position
    if (newValue.text != formattedValue) {
      if (newValue.selection.end >= 0 && newValue.selection.start >= 0) {
        final cursorPosition =
            formattedValue.length - (newTextLength - selectionIndex);
        selectionIndex = cursorPosition.clamp(0, formattedValue.length);
      }
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  String _formatAsPrice(String amount) {
    String value = amount.split('.').first;
    String first = value;
    String last = '';
    RegExp reg = RegExp(r'(\d{1,2})(?=(\d{2})+($|\.|$))');
    if (value.length > 1) {
      last = value[value.length - 1];
      first = value.substring(0, value.length - 1);
    }
    first = first.replaceAllMapped(reg, (Match match) => '${match[1]},');
    return '$first$last';
  }
}
