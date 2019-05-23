import 'package:flutter/material.dart';

import 'music_card.dart';
import 'music_model.dart';

class MusicList extends StatelessWidget {
  // Builder methods rely on a set of data, such as a list.
  final List<Music> songs;
  MusicList(this.songs);

  // First, make your build method like normal.
  // Instead of returning Widgets, return a method that returns widgets.
  // Don't forget to pass in the context!
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  // A builder method almost always returns a ListView.
  // A ListView is a widget similar to Column or Row.
  // It knows whether it needs to be scrollable or not.
  // It has a constructor called builder, which it knows will
  // work with a List.

  ListView _buildList(context) {
    return ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: songs.length,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // In our case, a DogCard for each doggo.
        return MusicCard(songs[int]);
      },
    );
  }
}