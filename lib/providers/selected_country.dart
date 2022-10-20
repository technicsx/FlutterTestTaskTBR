import 'package:flutter/cupertino.dart';
import 'package:test_task_tbr/models/country.dart';
import 'package:test_task_tbr/services/geolocation_fetcher.dart';

class SelectedCountry with ChangeNotifier {
  Country _country = Country("🇺🇸", "+1", "United States");

  Country get country => _country;

  Future<void> selectCountryByGeo() async {
    // _country = await GeolocationFetcher.instance.fetchGeo();
    notifyListeners();
  }

  void selectCountry(Country selected) {
    _country = selected;
    notifyListeners();
  }
}
