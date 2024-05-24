import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_movies/providers/favorites_provider.dart';
import 'package:app_movies/models/movie.dart';
import 'package:app_movies/pages/Home/home_details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obter a instância de FavoritesProvider
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    // Obter a lista de filmes favoritos usando a instância de FavoritesProvider
    final favoriteMovies = favoritesProvider.favoriteMovies;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          final movie = favoriteMovies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailScreen(movie: movie),
                ),
              );
            },
            child: ListTile(
              leading: Image.network(movie.image),
              title: Text(movie.title),
              subtitle: Text(movie.originalTitle),
            ),
          );
        },
      ),
    );
  }
}