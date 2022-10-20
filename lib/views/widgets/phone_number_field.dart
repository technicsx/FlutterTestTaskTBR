import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task_tbr/utils/phone_number_formatter.dart';
import '../../theme/constants.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({Key? key}) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: inputsHeight,
      child: TextField(
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(14),
          PhoneNumberFormatter()
        ],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: horizontalPadding),
          filled: true,
          fillColor: secondaryColor,
          hintText: "Your phone number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(style: BorderStyle.none, width: 0),
          ),
          hintStyle: const TextStyle(
              color: Color(0xFF8693c7), fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
