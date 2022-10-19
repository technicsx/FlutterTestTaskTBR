import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task_tbr/models/country.dart';

class CountryTile extends StatelessWidget {
  final Country country;

  const CountryTile({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => {},
        title: RichText(
            text: TextSpan(text: "${country.flag}   ", children: [
          TextSpan(
              text: "${country.phoneCode}  ",
              style: const TextStyle(color: Colors.purple, fontSize: 16)),
          TextSpan(
              text: country.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ])));
  }
}
