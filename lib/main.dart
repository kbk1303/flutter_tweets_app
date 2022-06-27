import 'package:flutter/material.dart';

import 'screens/screens.dart';



void main() {
  runApp(const CountryApp());
}

class CountryApp extends StatelessWidget {
  const CountryApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Countries',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
      ),
      home: const HomeScreen(),
    );
  }
}



