import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_task_tbr/views/sheet_view.dart';

class MainView extends StatefulWidget {
  final String screenHeading = "Get Started";

  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => Scaffold(
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
                            onTap: () =>
                                CupertinoScaffold.showCupertinoModalBottomSheet(
                                    context: context,
                                    builder: (context) => const SheetView()),
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
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        filled: true,
                                        fillColor: Color(0xffb8ccfc),
                                        hintText: "Your phone number",
                                        hintStyle: TextStyle(
                                            color: Color(0xFF8693c7),
                                            fontWeight: FontWeight.w500),
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
