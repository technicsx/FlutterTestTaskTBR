import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_tbr/providers/all_countries_info.dart';
import 'package:test_task_tbr/views/widgets/country_tile.dart';
import '../theme/constants.dart';

class SheetView extends StatefulWidget {
  static const headingText = "Country code";
  const SheetView({Key? key}) : super(key: key);

  @override
  State<SheetView> createState() => _SheetViewState();
}

class _SheetViewState extends State<SheetView> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = context.read<AllCountriesInfo>().currentQuery;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentCountries =
        context.watch<AllCountriesInfo>().searchedCountries;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      SheetView.headingText,
                      style: TextStyle(
                          fontSize: headingsFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.close,
                        size: 15,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: inputsHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadius),
                          color: secondaryColor),
                      child: Center(
                        child: TextField(
                          controller: textEditingController,
                          style: const TextStyle(
                              color: accentFontColor,
                              fontWeight: FontWeight.w500),
                          onChanged: (val) => context
                              .read<AllCountriesInfo>()
                              .searchCountries(val),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: accentFontColor,
                              ),
                              filled: true,
                              fillColor: secondaryColor,
                              hintText: "Search",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(borderRadius),
                                  borderSide: const BorderSide(
                                      style: BorderStyle.none, width: 0))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: currentCountries.length,
                itemBuilder: (BuildContext context, int index) {
                  return CountryTile(
                    country: currentCountries[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
