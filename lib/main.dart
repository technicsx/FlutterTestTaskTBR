import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_tbr/providers/all_countries_info.dart';
import 'package:test_task_tbr/providers/selected_country.dart';
import 'package:test_task_tbr/services/countries_fetcher.dart';
import 'package:test_task_tbr/views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectedCountry>(
            create: (_) => SelectedCountry()),
        ChangeNotifierProvider<AllCountriesInfo>(
            create: (_) => AllCountriesInfo())
      ],
      child: MaterialApp(
        title: 'TBR Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Consumer2<SelectedCountry, AllCountriesInfo>(
            builder: (context, selectedCountry, allCountriesInfo, _) {
          return AnimatedSplashScreen.withScreenFunction(
            splash: 'images/splash.png',
            screenFunction: () async {
              await allCountriesInfo.getAllCountries();
              await selectedCountry.selectCountryByGeo();

              return const MainView();
            },
            splashTransition: SplashTransition.scaleTransition,
          );
        }),
      ),
    );
  }
}
