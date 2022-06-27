
import 'dart:io';

class RandomCountryProvider {
  late final WebSocket webSocket;

  RandomCountryProvider() {
    initializeSocket();
  }

void initializeSocket() async{
  webSocket = await WebSocket.connect('ws://localhost:7071');
}


  
}

