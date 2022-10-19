import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StartScreen extends StatefulWidget {
  final String screenHeading = "Get Started";

  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) =>  Scaffold(
            backgroundColor: const Color(0xFF90ACFC),
            floatingActionButton: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.arrow_forward,
                  size: 32,
                  color: Colors.black,
                ),
                onPressed: () => {}),
            body: Container(
              color: const Color(0xFF90ACFC),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text(
                            widget.screenHeading,
                            style: const TextStyle(
                                fontSize: 38.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () => CupertinoScaffold
                                  .showCupertinoModalBottomSheet(

                                      context: context,
                                      builder: (context) => Scaffold(
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
                                                      itemCount: 22,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Container(
                                                          height: 50,
                                                          child: Center(
                                                              child: Text(
                                                                  'Entry')),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ))),
                              child: Container(
                                height: 50,
                                child: Center(child: Text("+1")),
                                decoration: BoxDecoration(
                                  color: Color(0xffb8ccfc),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            )),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                                flex: 4,
                                child: SizedBox(
                                    height: 50,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: 20),
                                          filled: true,
                                          fillColor: Color(0xffb8ccfc),
                                          hintText: "Your phone number",
                                          hintStyle: TextStyle(
                                            color: Color(0xFF8693c7),
                                            fontWeight: FontWeight.w500
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              borderSide: const BorderSide(
                                                  style: BorderStyle.none,
                                                  width: 0))),
                                    ))),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
