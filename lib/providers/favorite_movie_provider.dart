import 'package:flutter/material.dart';
import 'package:tixket/data/movie.dart';

class FavoriteMovieProvider extends ChangeNotifier {
  List<Movie> favoriteMovie = [];

  void addMovie(Movie m) {
    favoriteMovie.add(m);
    notifyListeners();
  }

  void removeMovie(Movie m) {
    favoriteMovie.remove(m);
    notifyListeners();
  }
}