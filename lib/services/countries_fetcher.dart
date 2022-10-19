import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task_tbr/models/country.dart';

class CountriesFetcher {
  static final _allCountriesURL = "https://restcountries.com/v2/all";

  static CountriesFetcher get instance => _instance;
  static final CountriesFetcher _instance = CountriesFetcher._();

  CountriesFetcher._();

  Future<List<Country>> fetchAllCountries() async {
    var resultResponse = await http.get(Uri.parse(_allCountriesURL));
    if (resultResponse.statusCode == 200) {
      try {
        var decodedResultList = jsonDecode(resultResponse.body)[""] as List;
        return decodedResultList.map((country) => Country.fromJson(country)).toList();
      } catch (err) {
        print("Couldn't decode");
      }
    }
    return [];
  }

  Future<List<Country>> fetchCountryByGeo() async {
    var resultResponse = await http.get(Uri.parse(_allCountriesURL));
    if (resultResponse.statusCode == 200) {
      try {
        var decodedResultList = jsonDecode(resultResponse.body)[""] as List;
        return decodedResultList.map((country) => Country.fromJson(country)).toList();
      } catch (err) {
        print("Couldn't decode");
      }
    }
    return [];
  }
}
