import 'package:flutter/material.dart';
import 'package:rating_app/movie_detail_page.dart';

import 'movie_model.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;

  MovieCard(this.movie);

  @override
  _MovieCardState createState() => _MovieCardState(movie);
}

class _MovieCardState extends State<MovieCard> {
  Movie movie;
  String renderUrl;

  _MovieCardState(this.movie);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showMovieDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 105.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 50.0,
                child: movieCard,
              ),
              Positioned(top: 5.0, child: dogImage),
            ],
          ),
        ),
      ),
    );
  }

  showMovieDetailPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MovieDetailPage(movie);
        },
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
    await movie.getImageUrl();
    setState(() {
      renderUrl = movie.imageUrl;
    });
  }

  Widget get movieCard {
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
              Text(widget.movie.title,
                style: Theme.of(context).textTheme.title),
              Text(widget.movie.year.toString(),
                style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': ${widget.movie.rating} / 10')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}