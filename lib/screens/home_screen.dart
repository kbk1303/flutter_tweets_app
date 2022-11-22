import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tweets_app/screens/random_country_screen.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCountries(),
        builder: (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Countries',
                    style: TextStyle(
                      color: Color(0xFF1777F2),
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    ),
                  ),
                  centerTitle: false,
                  floating: true,
                  actions: [
                    CircleButton(
                      icon: Icons.rotate_right_rounded,
                      iconSize: 30.0,
                      // ignore: avoid_print
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => RandomCountry(),
                        ),
                      ),
                    ),
                    CircleButton(
                        icon: Icons.add,
                        iconSize: 30.0,
                        // ignore: avoid_print
                        onPressed: () => print('add pressed')),
                  ],
                ) /* ,
          SliverToBoxAdapter(
            child: Container(
              height: 200.0,
              color: Colors.blue,
            ),
          ) */
                ,
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final countriesList = snapshot.data;
                      final Country country = countriesList![index];
                      return CountryContainer(country: country);
                    },
                    childCount: snapshot.data!.length,
                  ),
                ),
              ],
            );
          }
        });
  }
}

Future<List<Country>> getCountries() async {
  Countries c = Countries();
  return await c.createCountries();
}
