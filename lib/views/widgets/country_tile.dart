import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_tbr/models/country.dart';
import 'package:test_task_tbr/providers/selected_country.dart';

class CountryTile extends StatelessWidget {
  final Country country;

  const CountryTile({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SelectedCountry>().selectCountry(country);
        print(country.name);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: RichText(
          text: TextSpan(
            text: "${country.flag}   ",
            children: [
              TextSpan(
                text: "${country.phoneCode}  ",
                style: const TextStyle(color: Colors.purple, fontSize: 16),
              ),
              TextSpan(
                  text: country.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
