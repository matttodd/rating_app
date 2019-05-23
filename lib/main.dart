// main.dart
import 'package:flutter/material.dart';

import 'music_model.dart';
import 'music_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// MaterialApp is the base Widget for your Flutter Application
    /// Gives us access to routing, context, and meta info functionality.
    return MaterialApp(
      title: 'We Rate Music',
      // Make all our text default to white
      // and backgrounds default to dark
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: 'We Rate Music'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Music> initialSongs = []
    ..add(Music('Spice Girl', 'Amine', 'Good For You'))
    ..add(Music('BLEACH', 'BROCKHAMPTON', 'SATURATION III'))
    ..add(Music('Spice Girl', 'Amine', 'Good For You'))
    ..add(Music('BLEACH', 'BROCKHAMPTON', 'SATURATION III'))
    ..add(Music('Spice Girl', 'Amine', 'Good For You'))
    ..add(Music('BLEACH', 'BROCKHAMPTON', 'SATURATION III'));
  @override
  Widget build(BuildContext context) {
    /// Scaffold is the base for a page.
    /// It gives an AppBar for the top,
    /// Space for the main body, bottom navigation, and more.
    return Scaffold(
      /// App bar has a ton of functionality, but for now lets
      /// just give it a color and a title.
      appBar: AppBar(
        /// Access this widgets properties with 'widget'
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      /// Container is a convenience widget that lets us style it's
      /// children. It doesn't take up any space itself, so it
      /// can be used as a placeholder in your code.
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.deepPurple[800],
              Colors.deepPurple[700],
              Colors.deepPurple[600],
              Colors.deepPurple[400],
            ],
          ),
        ),
        child: Center(
          child: MusicList(initialSongs),
        ),
      ),
    );
  }
}