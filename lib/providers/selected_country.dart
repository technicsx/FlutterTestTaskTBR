import 'package:flutter/cupertino.dart';
import 'package:test_task_tbr/models/country.dart';

class SelectedCountry with ChangeNotifier {
  Country? _country;
  Country? get country => _country;
  Future<void> selectCountryByGeo() async {
    _country = ;
    notifyListeners();
  }
  void selectCountry(Country selected){
    _country = selected;
    notifyListeners();
  }
}