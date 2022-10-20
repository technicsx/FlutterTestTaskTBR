import 'package:flutter/cupertino.dart';
import 'package:test_task_tbr/models/country.dart';
import 'package:test_task_tbr/services/countries_fetcher.dart';

class AllCountriesInfo with ChangeNotifier {
  List<Country> _countries = [];
  List<Country> _searchedCountries = [];
  String _currentQuery = "";

  List<Country> get countries => _countries;

  List<Country> get searchedCountries => _searchedCountries;

  String get currentQuery => _currentQuery;

  Future<void> getAllCountries() async {
    _countries = await CountriesFetcher.instance.fetchAllCountries();
    _searchedCountries = countries;
    notifyListeners();
  }

  void searchCountries(String val) async {
    if (_countries.isNotEmpty) {
      _currentQuery = val;
      if (_currentQuery.isNotEmpty) {
        _searchedCountries = _countries
            .where((country) => country.name
                .toLowerCase()
                .contains(_currentQuery.toLowerCase()))
            .toList();
      } else {
        _searchedCountries = countries;
      }
      notifyListeners();
    }
  }
}
