

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class CountryDetails extends StatelessWidget {
  final Country country;
  final bool random;
  const CountryDetails({Key? key, required this.country, required this.random}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.white,
            expandedHeight: 40.0,
            leading: 
              IconButton(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(),
                icon: const Icon(Icons.arrow_back, color: Colors.blue, size: 30.0),
                onPressed: () => Navigator.pop(context),
              
              ),

            flexibleSpace: FlexibleSpaceBar(
              title: 
                Row(
                  children: [
                    const SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFe0f2f1)),
                      child:  ScalableImageWidget.fromSISource(
                          si: ScalableImageSource.fromSvgHttpUrl(
                            Uri.parse(country.flagUrl),
                          ),
                        ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text
                      (
                        country.name,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                        ),
                      ),

                  ],
                ),
            ),

          ),
           !random? WebviewInternal(country: country): DataviewInternal(country: country),
          
           //),
        ],
            
      ),
    );
  }
}