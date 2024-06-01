import 'package:app_movies/core/app_images.dart';
import 'package:app_movies/pages/Books/books_page.dart';
import 'package:app_movies/pages/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
                    leading: Image.network(movie.image),
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
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: movie.watched ? Colors.green : Colors.grey,
                          ),
                          onPressed: () {
                            String message =
                                movie.watched ? 'Não Assistido' : 'Assistido';
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                                duration:
                                    Duration(seconds: 1), // Duração da mensagem
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
                            favoritesProvider.toggleFavorite(movie);
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
              padding: const EdgeInsets.only(top: 25.0),
              child: Image.asset(
                'assets/images/jiji2.png',
                width: 280,
                height: 155,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Icon(Iconsax.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Icon(Iconsax.ticket),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Icon(Iconsax.book_1),
            ),
            label: 'Books',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 52, 52, 52),
        unselectedItemColor: Color.fromARGB(255, 51, 51, 51),
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MyHomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FavoriteScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BookPage()),
            );
          }
        },
      ),
    );
  }
}
