import 'package:flutter/cupertino.dart';
import 'package:test_task_tbr/models/country.dart';
import 'package:test_task_tbr/services/countries_fetcher.dart';

class AllCountriesInfo with ChangeNotifier {
  List<Country> _countries = [];
  List<Country> get countries => _countries;
  Future<void> getAllCountries() async {
    _countries = await CountriesFetcher.instance.fetchAllCountries();
    notifyListeners();
  }
}