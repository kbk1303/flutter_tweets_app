
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'models.dart';

class Tweets {
  List<Twat> tweets = [];
  Tweets() {
   createTweets();
  }

  void createTweets() async {
    tweets = await loadTweets();
    if (kDebugMode) {
      print(tweets[0].tweet);
    }
  }

  Future<List<Twat>> loadTweets() async {
    final String response = await rootBundle.loadString('assets/json/tweets.json'); 
    return parseTweets(response);
  }

  List<Twat> parseTweets(String jsonTweets) {
    List parsed = jsonDecode(jsonTweets)['Data120161205TrumpTwitterAll'];
    return parsed.map<Twat>((json) => Twat.fromJson(json)).toList();
  }
}