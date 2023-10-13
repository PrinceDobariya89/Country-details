
import 'package:flutter/material.dart';
import 'package:practical_exam/helper/api_helper.dart';
import 'package:practical_exam/model/country_model.dart';

class CountryProvider extends ChangeNotifier {
  List<CountryModel> _country_model = [];
  List<CountryModel> get countryList => _country_model;

  void getCountry() async {
    _country_model = await ApiHelper.getCountry();
    notifyListeners();
  }

  void sortCountry() {
    _country_model.sort((a, b) =>
        a.name!.common.toString().compareTo(b.name!.common.toString()));
    notifyListeners();
  }
}
