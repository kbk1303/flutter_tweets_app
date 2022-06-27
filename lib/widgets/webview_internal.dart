import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tweets_app/models/models.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewInternal extends StatelessWidget {
  final Country country;
  const WebviewInternal({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.vertical,
      body: WebView(
        initialUrl: country.wikiUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (int progress) {
                if(kDebugMode) ('Henter wiki...$progress%)');
              }
      ),
    );
    */

    return 
            SliverToBoxAdapter(
              child:
            SizedBox(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.vertical,
              child: WebView(
                initialUrl: country.wikiUrl,
                // ignore: prefer_collection_literals
                gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer())),
              ),
            ),
            );

  }

  
}