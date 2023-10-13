import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practical_exam/model/country_model.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  factory ApiHelper() {
    return ApiHelper._();
  }

  static Future<List<CountryModel>> getCountry() async {
    List<CountryModel> countryModel = [];
    try {
      String baseUrl =
          'https://restcountries.com/v3.1/independent?status=true&fields=languages,name,capital,region,population';
      var res = await http.get(Uri.parse(baseUrl));
      var decode = jsonDecode(res.body);
      countryModel =
          List.from(decode.map((json) => CountryModel.fromJson(json)));
    } catch (e) {
      print(e.toString());
    }
    return countryModel;
  }
}
