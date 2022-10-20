import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_task_tbr/providers/button_activation.dart';
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
        style: const TextStyle(
          color: accentFontColor,
        ),
        onChanged: (val) {
          bool shouldActivate = val.length >= 14 ? true : false;
          if (shouldActivate != context.read<ButtonActivation>().isActivated) {
            context.read<ButtonActivation>().toggleButton(shouldActivate);
          }
        },
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9\\-\\(\\) ]")),
          PhoneNumberFormatter()
        ],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: horizontalPadding),
          filled: true,
          fillColor: secondaryColor,
          hintText: "(123) 123-1234",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(style: BorderStyle.none, width: 0),
          ),
          hintStyle: const TextStyle(
              color: primaryColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
