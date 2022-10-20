import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  final hintExample = "(123) 1234-123";

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > oldValue.text.length) {
      if (newValue.text.length > hintExample.length) {
        return oldValue;
      }
    }
    final lastInput = newValue.text[newValue.text.length - 1];
    if (RegExp(r'\d').hasMatch((lastInput))) {
      return oldValue;
    }
    if (newValue.text.isNotEmpty &&
        RegExp("-| |(|)").hasMatch(hintExample[newValue.text.length - 1])) {
      return TextEditingValue(
        text:
            "${oldValue.text}${hintExample[newValue.text.length - 1]}${newValue.text[newValue.text.length - 1]}",
        selection: TextSelection.collapsed(offset: newValue.selection.end),
      );
    }
    return newValue;
  }
}
