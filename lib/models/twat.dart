
class Twat {
  late String date;
  late String time;
  late String tweet;
  late String client;
  late String clientSimplified;

  Twat({
    required this.date, 
    required this.time, 
    required this.tweet, 
    required this.client, 
    required this.clientSimplified
  });

  Twat.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    time = json['Time']; 
    tweet = json['Tweet']; 
    client = json['Client']; 
    clientSimplified = json['ClientSimplified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Date'] = date;
    data['Time'] = time;
    data['Tweet'] = tweet;
    data['Client'] = client;
    data['ClientSimplified'] = clientSimplified;
    return data;
  }

}