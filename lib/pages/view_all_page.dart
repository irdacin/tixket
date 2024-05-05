import 'package:flutter/material.dart';
import 'package:tixket/components/movie_card.dart';
import 'package:tixket/data/movie.dart';

class ViewAllPage extends StatelessWidget {
  final List<Movie> movies;
  final String typeMovie;

  const ViewAllPage({
    super.key, 
    required this.movies, 
    required this.typeMovie
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          typeMovie,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (MediaQuery.of(context).size.width / 2 - 10) / 370
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieCard(movie: movies[index]),
      ),
    );
  }
}