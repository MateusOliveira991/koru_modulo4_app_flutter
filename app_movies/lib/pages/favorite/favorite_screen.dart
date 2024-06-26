import 'package:app_movies/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_movies/pages/favorite/favorites_provider.dart';
import 'package:app_movies/pages/Home/home_details_screen.dart';
import 'package:app_movies/core/app_colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteMovies = favoritesProvider.favoriteMovies;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Meus Favoritos',
          style: TextStyle(
            color: AppColors.textColor,
            fontFamily: 'Merriweather',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
              AppColors.backgroundColor,
              AppColors.accentColor,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: favoriteMovies.length,
                itemBuilder: (context, index) {
                  final movie = favoriteMovies[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        movie.image,
                      ),
                    ),
                    title: Text(
                      movie.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      movie.originalTitle,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            movie.watched
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: movie.watched ? Colors.green : Colors.grey,
                          ),
                          onPressed: () {
                            String message =
                                movie.watched ? 'Não Assistido' : 'Assistido';
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                            favoritesProvider.toggleWatched(movie);
                          },
                        ),
                        IconButton(
                          icon: const ImageIcon(
                            AssetImage(AppImages.corequebrado),
                            color: Colors.red,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirmação'),
                                  content: const Text(
                                      'Remover filme dos favoritos?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Não'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Sim'),
                                      onPressed: () {
                                        favoritesProvider.toggleFavorite(movie);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailScreen(movie: movie),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/jiji2.png',
                width: 280,
                height: 155,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
