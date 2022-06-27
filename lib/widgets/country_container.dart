

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tweets_app/screens/details_country_screen.dart';
import 'package:jovial_svg/jovial_svg.dart';
import '../models/models.dart';

class CountryContainer extends StatelessWidget {
  final Country country;
  CountryContainer({Key? key, required this.country}) : super(key: key){
    if (kDebugMode) {
         print(country);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration:const BoxDecoration(color: Colors.white),


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          CountryHeader(country: country),
        ],
      ),
    );
  }
}

class CountryHeader extends StatelessWidget {
  final Country country;
  const CountryHeader({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return
      Card(
      child: InkWell( 
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountryDetails(country: country, random:false),
          ),
        ),
        child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[200],
              child: ScalableImageWidget.fromSISource(
                si: ScalableImageSource.fromSvgHttpUrl(
                  Uri.parse(country.flagUrl),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            children: [
              Text
              (
                country.name,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    
                ),
              ),
            ],
          ),
        ], 
      ),
      ),
      );
  }
}