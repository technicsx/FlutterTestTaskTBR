import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_tbr/models/country.dart';
import 'package:test_task_tbr/providers/all_countries_info.dart';
import 'package:test_task_tbr/views/widgets/country_tile.dart';
class SheetView extends StatefulWidget {
  const SheetView({Key? key}) : super(key: key);

  @override
  State<SheetView> createState() => _SheetViewState();
}

class _SheetViewState extends State<SheetView> {



  @override
  Widget build(BuildContext context) {
    final countries = context.watch<AllCountriesInfo>().countries;
    return Scaffold(
        backgroundColor: Color(0xFF90ACFC),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                      const EdgeInsets
                          .only(
                          top: 20.0),
                      child: Text(
                        "Country code",
                        style:
                        const TextStyle(
                            fontSize:
                            38.0,
                            fontWeight:
                            FontWeight
                                .bold,
                            color: Colors
                                .white),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        child: Center(
                            child: Padding(
                              padding:
                              const EdgeInsets
                                  .all(5.0),
                              child: Icon(
                                Icons.close,
                                size: 15,
                              ),
                            )),
                        decoration: BoxDecoration(
                          color:
                          Color(0xffb8ccfc),
                          borderRadius:
                          BorderRadius
                              .circular(8.0),
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: Icon(Icons.search_rounded),
                                filled: true,
                                fillColor: Color(
                                    0xffb8ccfc),
                                hintText:
                                "country",
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        16.0),
                                    borderSide: const BorderSide(
                                        style: BorderStyle
                                            .none,
                                        width:
                                        0))),
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection:
                    Axis.vertical,
                    shrinkWrap: true,
                    physics:
                    BouncingScrollPhysics(),
                    padding:
                    const EdgeInsets.all(
                        8),
                    itemCount: countries.length,
                    itemBuilder:
                        (BuildContext context,
                        int index) {
                      return CountryTile(country: countries[index],);
                    }),
              ),
            ],
          ),
        ));
  }
}
