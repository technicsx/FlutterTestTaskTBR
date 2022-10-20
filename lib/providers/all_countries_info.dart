import 'package:flutter/cupertino.dart';
import 'package:test_task_tbr/models/country.dart';
import 'package:test_task_tbr/services/countries_fetcher.dart';

class AllCountriesInfo with ChangeNotifier {
  List<Country> _countries = [];
  List<Country> _searchedCountries = [];

  List<Country> get countries => _countries;

  List<Country> get searchedCountries => _searchedCountries;

  Future<void> getAllCountries() async {
    _countries = await CountriesFetcher.instance.fetchAllCountries();
    notifyListeners();
  }

  void searchCountries(String val) async {
    if (_countries.isNotEmpty) {
      if (val.isNotEmpty) {
        _searchedCountries =
            _countries.where((country) => country.name.toLowerCase().contains(val.toLowerCase())).toList();
      } else {
        _searchedCountries = countries;
      }
      notifyListeners();
    }
  }
}
