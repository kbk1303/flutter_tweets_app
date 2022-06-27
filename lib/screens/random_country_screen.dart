import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/models.dart';
import 'screens.dart';

class RandomCountry extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  RandomCountry({Key? key}) : super(key: key);
  final uri = Uri(port: 7071, scheme: 'ws', host: '10.108.162.11');

  @override
  Widget build(BuildContext context) {
    print(uri);
    final channel = WebSocketChannel.connect(uri);
    return StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(
              color: Colors.red,
            );
          } else {
            var parsed = jsonDecode(snapshot.data as String);
            parsed = parsed['country'];
            final Country c = Country.fromJson(parsed);
            return CountryDetails(country: c, random: true);
          }
        });
  }
}
