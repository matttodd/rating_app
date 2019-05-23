import 'dart:convert';

import 'dart:io';

class Music {
  final String title;
  final String artist;
  final String album;
  String imageUrl;

  int rating = 0;

  Music(this.title, this.artist, this.album);

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