import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task_tbr/models/country.dart';

class CountriesFetcher {
  static final _allCountriesURL = "https://restcountries.com/v3.1/all";

  static CountriesFetcher get instance => _instance;
  static final CountriesFetcher _instance = CountriesFetcher._();

  CountriesFetcher._();

  Future<List<Country>> fetchAllCountries() async {
    var resultResponse = await http.get(Uri.parse(_allCountriesURL));
    if (resultResponse.statusCode == 200) {
      try {
        var decodedResultList = jsonDecode(resultResponse.body) as List;
        List<Country> list = decodedResultList
            .map((country) => Country.fromJson(country)).where((country) => country.phoneCode.isNotEmpty)
            .toList();
        list.sort((a, b) => a.name.compareTo(b.name));
        return list;
      } catch (err) {
        print(err);
      }
    }
    return [];
  }

  Future<List<Country>> fetchCountryByGeo() async {
    var resultResponse = await http.get(Uri.parse(_allCountriesURL));
    if (resultResponse.statusCode == 200) {
      try {
        var decodedResultList = jsonDecode(resultResponse.body) as List;
        return decodedResultList
            .map((country) => Country.fromJson(country))
            .toList();
      } catch (err) {
        print(err);
      }
    }
    return [];
  }
}
