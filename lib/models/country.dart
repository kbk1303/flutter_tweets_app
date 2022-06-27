import 'package:flutter/material.dart';

class Country {
  late String name;
  late String flagUrl;
  late Image flag;
  late int area; 
  late int population;
  late String wikiUrl;

  Country({
    required this.name,
    required this.flagUrl,
    required this.area,
    required this.population,
    required this.wikiUrl
  });

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flagUrl = json['flag'];
    area = json['area'];
    population = json['population'];  
    wikiUrl = json['wikiUrl'];
    setFlag();
  }

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['name'] = name;
      data['flag'] = flagUrl;
      data['area'] = area;
      data['population'] = population;
      data['wikiUrl'] = wikiUrl;
      return data;
  }

  void setFlag() async {
    const String rootUrl = "https://upload.wikimedia.org/wikipedia/commons/";
    flag = Image.network(rootUrl+flagUrl);
    flagUrl = rootUrl + flagUrl;
  }

  @override
  String toString() {
    return "name: $name, area: $area, populaton: $population, wiki: $wikiUrl";  
  }

}