import 'package:flutter/material.dart';

import 'movie_model.dart';
import 'movie_list.dart';
import 'new_movie_form.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// MaterialApp is the base Widget for your Flutter Application
    /// Gives us access to routing, context, and meta info functionality.
    return MaterialApp(
      title: 'We Rate Movies',
      // Make all our text default to white
      // and backgrounds default to dark
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: 'We Rate Movies'),
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
  List<Movie> initialMovies = []
    ..add(Movie('Spider-Man Into The Spider-Verse', 2018, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a turpis non leo finibus suscipit. Maecenas dictum vitae libero et ornare. Nunc posuere, sapien nec congue hendrerit, magna arcu rhoncus purus, quis lobortis sem turpis in libero. Vivamus semper erat vitae leo blandit viverra eget non ante. Proin vel lacinia dui, eu feugiat risus. Vestibulum id lorem vel orci eleifend pretium a ultrices lectus. Sed interdum quis quam non molestie. Aenean imperdiet consectetur ligula, id pulvinar dolor. Ut quis rutrum leo.'))
    ..add(Movie('The Favourite', 2018, 'Yorgos Lanthimos'))
    ..add(Movie('Bohemian Rhapsody', 2018, 'Bryan Singer'))
    ..add(Movie('Black Panther', 2018, 'Ryan Coogler'))
    ..add(Movie('Avengeres: Endgame', 2019, 'Anthony, Joe Russo'))
    ..add(Movie('A Quiet Place', 2018, 'John Kransinski'));
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showNewMovieForm,
          )
        ],
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
          child: MovieList(initialMovies),
        ),
      ),
    );
  }

  Future _showNewMovieForm() async {
    Movie newMovie = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddMovieFormPage();
        },
      ),
    );

    if (newMovie != null) {
      initialMovies.add(newMovie);
    }
  }
}