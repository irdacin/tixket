import 'package:flutter/material.dart';
import 'package:tixket/components/movie_card.dart';
import 'package:tixket/models/movie_model.dart';

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: (MediaQuery.of(context).size.width / 2 - 20) / 400
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) => MovieCard(movie: movies[index]),
        ),
      ),
    );
  }
}