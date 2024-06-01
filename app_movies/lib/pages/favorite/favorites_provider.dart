import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/api/movie_api.dart'; // Importe a classe da API

class FavoritesProvider with ChangeNotifier {
  final List<String> _favoriteMovieIds = [];
  final List<Movie> _favoriteMovies = [];

  List<String> get favoriteMovieIds => _favoriteMovieIds;
  List<Movie> get favoriteMovies => _favoriteMovies;

  FavoritesProvider() {
    _loadFavorites();
  }

  bool isFavorite(String id) {
    return _favoriteMovieIds.contains(id);
  }

  void toggleFavorite(Movie movie) async {
    if (isFavorite(movie.id)) {
      _favoriteMovieIds.remove(movie.id);
      _favoriteMovies.removeWhere((m) => m.id == movie.id);
    } else {
      _favoriteMovieIds.add(movie.id);
      _favoriteMovies.add(movie);
    }
    notifyListeners();
    await _saveFavorites();
  }

  void toggleWatched(Movie movie) {
    movie.watched = !movie.watched;
    notifyListeners();
  }

  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteIds = prefs.getStringList('favoriteMovieIds');
    if (favoriteIds != null) {
      _favoriteMovieIds.addAll(favoriteIds);
      // Carregar detalhes dos filmes favoritos da API
      for (String id in favoriteIds) {
        _fetchFavoriteMovieDetails(id);
      }
    }
  }

  Future<void> _fetchFavoriteMovieDetails(String id) async {
    try {
      List<Movie> movies = await MovieApi.fetchMovies();
      Movie? movie;
      for (var m in movies) {
        if (m.id == id) {
          movie = m;
          break;
        }
      }
      if (movie != null) {
        _favoriteMovies.add(movie);
        notifyListeners();
      }
    } catch (e) {
      return ;
     
    }
  }

  Future<void> _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoriteMovieIds', _favoriteMovieIds);
  }
}
