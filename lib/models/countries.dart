import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tweets_app/models/models.dart';

class Countries {
  List<Country> countriesList = [];
  Countries() {
    createCountries();
  }


  Future<List<Country>> createCountries() async {
    countriesList = await loadCountries();
    /*
    if (kDebugMode) {
        print(countriesList);
    }
    */
    return await loadCountries();
  }

  Future<List<Country>> loadCountries() async {
      final String response = await rootBundle.loadString('assets/json/countries.json'); 
      List parsed = jsonDecode(response)['countries'];
      return parseCountries(parsed);
  }

  List<Country> parseCountries(List response) {
    return response.map<Country>((json) => Country.fromJson(json)).toList();
  }

}
