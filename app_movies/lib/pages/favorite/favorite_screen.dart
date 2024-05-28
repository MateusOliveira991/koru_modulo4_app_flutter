import 'package:app_movies/pages/Books/books_page.dart';
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
              AppColors.accentColor,
              AppColors.backgroundColor,
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
        selectedItemColor: const Color(0xFFBCBCCD),
        unselectedItemColor: const Color(0xFFBCBCCD),
        onTap: (int index) {
          if (index == 1) {
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
