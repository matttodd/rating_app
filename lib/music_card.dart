import 'package:flutter/material.dart';

import 'music_model.dart';

class MusicCard extends StatefulWidget {
  final Music music;

  MusicCard(this.music);

  @override
  _MusicCardState createState() => _MusicCardState(music);
}

class _MusicCardState extends State<MusicCard> {
  Music music;
  String renderUrl;

  _MusicCardState(this.music);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 105.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50.0,
              child: musicCard,
            ),
            Positioned(top: 5.0, child: dogImage),
          ],
        ),
      ),
    );
  }

  Widget get dogImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await music.getImageUrl();
    setState(() {
      renderUrl = music.imageUrl;
    });
  }

  Widget get musicCard {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.music.title,
                style: Theme.of(context).textTheme.headline),
              Text(widget.music.artist,
                style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': ${widget.music.rating} / 10')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}