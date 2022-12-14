import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  static const hintExample = "(123) 234-1234";

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > hintExample.length) {
          return oldValue;
        }

        int lastIndex = newValue.text.length - 1;
        String curSubStr = hintExample[lastIndex];
        String curNewSubStr = newValue.text[lastIndex];

        if (newValue.text.length < hintExample.length &&
            (curSubStr == "(" || curSubStr == ")" || curSubStr == "-")) {
          bool isClosing = curSubStr == ")";
          if (int.tryParse(curNewSubStr) == null) {
            return oldValue;
          }
          return TextEditingValue(
            text:
                "${oldValue.text}${isClosing ? "$curSubStr " : curSubStr}$curNewSubStr",
            selection: TextSelection.collapsed(
                offset: newValue.selection.end + (isClosing ? 2 : 1)),
          );
        }
        final inHinted = int.tryParse(curSubStr);
        final inNew = int.tryParse(curNewSubStr);
        if (inHinted == null && inNew != null ||
            inHinted != null && inNew == null) {
          return oldValue;
        }
      }
    }

    return newValue;
  }
}
