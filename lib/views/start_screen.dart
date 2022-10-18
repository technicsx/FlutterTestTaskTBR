import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  final String screenHeading = "Get Started";

  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: const Icon(
            Icons.arrow_forward,
          ),
          onPressed: () => {}),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  widget.screenHeading,
                  style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "country",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                    style: BorderStyle.none, width: 0))),
                      ),
                    ),
                    Flexible(
                        child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "country",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  style: BorderStyle.none, width: 0))),
                    )),
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
    );
  }
}
