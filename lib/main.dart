import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_tbr/providers/all_countries_info.dart';
import 'package:test_task_tbr/providers/selected_country.dart';
import 'package:test_task_tbr/views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectedCountry>(
          create: (_) => SelectedCountry(),
        ),
        ChangeNotifierProvider<AllCountriesInfo>(
          create: (_) => AllCountriesInfo(),
        )
      ],
      child: MaterialApp(
        title: 'TBR Flutter Demo',
        home: Consumer2<SelectedCountry, AllCountriesInfo>(
            builder: (context, selectedCountry, allCountriesInfo, _) {
          return AnimatedSplashScreen.withScreenFunction(
            splash: 'images/splash.png',
            screenFunction: () async {
              await allCountriesInfo.getAllCountries();
              await selectedCountry.selectCountryByGeo();
              return const MainView();
            },
            splashTransition: SplashTransition.fadeTransition,
          );
        }),
      ),
    );
  }
}
