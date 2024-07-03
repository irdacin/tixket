import 'package:flutter/material.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/providers/user_provider.dart';

class FavoriteMovieProvider extends ChangeNotifier {
  final UserProvider _userProvider;
  FavoriteMovieProvider(this._userProvider);
  
  List<Movie> get favoriteMovie => _userProvider.currentUser!.favoriteMovie ?? [];

  void addMovie(Movie m) {
    _userProvider.currentUser!.favoriteMovie ??= [];
    _userProvider.currentUser!.favoriteMovie!.add(m);
    notifyListeners();
  }

  void removeMovie(Movie m) {
    _userProvider.currentUser!.favoriteMovie!.remove(m);
    notifyListeners();
  }
}