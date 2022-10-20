import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_task_tbr/models/country.dart';
import 'package:test_task_tbr/services/geolocation_fetcher.dart';

class SelectedCountry with ChangeNotifier {
  Country _country = Country("🇺🇸", "+1", "United States");

  Country get country => _country;

  Future<void> selectCountryByGeo(List<Country> countries) async {
    Position pos = await GeolocationFetcher.instance.fetchGeo();
    final lat = pos.latitude;
    final long = pos.longitude;
    String? countryName = await GeolocationFetcher.instance.getCountryByGeo(lat, long);
    if(countryName!=null){
      final countriesByGeo = countries.where((country) => country.name.contains(countryName)).toList();
      if(countriesByGeo.isNotEmpty) {
        _country = countriesByGeo[0];
        notifyListeners();
      }
    }
  }

  void selectCountry(Country selected) {
    _country = selected;
    notifyListeners();
  }
}
