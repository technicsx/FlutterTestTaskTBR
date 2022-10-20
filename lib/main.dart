import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_tbr/providers/all_countries_info.dart';
import 'package:test_task_tbr/providers/selected_country.dart';
import 'package:test_task_tbr/theme/constants.dart';
import 'package:test_task_tbr/views/main_view.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const title = "TBR Flutter Task";
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
        title: title,
        home: Consumer2<SelectedCountry, AllCountriesInfo>(
          builder: (context, selectedCountry, allCountriesInfo, _) {
            return AnimatedSplashScreen.withScreenFunction(
              backgroundColor: primaryColor,
              splash: const Icon(
                Icons.phone_in_talk_rounded,
                size: 68,
                color: Colors.white,
              ),
              screenFunction: () async {
                await allCountriesInfo.getAllCountries();
                await selectedCountry.selectCountryByGeo(allCountriesInfo.countries);
                return const MainView();
              },
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
            );
          },
        ),
      ),
    );
  }
}
