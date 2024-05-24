// favorites_provider.dart
import 'package:flutter/material.dart';
import 'package:app_movies/models/movie.dart';

class FavoritesProvider with ChangeNotifier {

  bool isFavorite(String id) {
    return _favoriteMovies.any((movie) => movie.id == id);
  }

  final List<Movie> _favoriteMovies = [];

  List<Movie> get favoriteMovies => _favoriteMovies;

  void toggleFavorite(Movie movie) {
    if (_favoriteMovies.contains(movie)) {
      _favoriteMovies.remove(movie);
    } else {
      _favoriteMovies.add(movie);
    }
    notifyListeners();
  }
}
