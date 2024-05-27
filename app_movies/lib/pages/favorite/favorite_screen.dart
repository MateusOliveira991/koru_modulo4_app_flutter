import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_movies/pages/favorite/favorites_provider.dart';
import 'package:app_movies/pages/Home/home_details_screen.dart';
import 'package:app_movies/core/app_colors.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    final favoriteMovies = favoritesProvider.favoriteMovies;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Meus Favoritos',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.iconColor,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundColor,
              AppColors.accentColor,
              AppColors.backgroundColor,
            ],
          ),
        ),
        child: ListView.builder(
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
                title: Text(
                  movie.title,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  movie.originalTitle,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
