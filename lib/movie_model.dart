import 'dart:convert';

import 'dart:io';

class Movie {
  final String title;
  final int year;
  final String critique;
  String imageUrl;

  int rating = 0;

  Movie(this.title, this.year, this.critique);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    try {
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      imageUrl = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  }
}