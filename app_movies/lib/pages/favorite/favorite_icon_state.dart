import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:app_movies/models/movie.dart';
import 'package:provider/provider.dart';
import 'package:app_movies/pages/favorite/favorites_provider.dart';

class FavoriteIconButton extends StatefulWidget {
  final Movie movie;

  const FavoriteIconButton({super.key, required this.movie});

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final favoritesProvider =
            Provider.of<FavoritesProvider>(context, listen: false);
        favoritesProvider.toggleFavorite(widget.movie);
      },
      icon: Icon(
        context.watch<FavoritesProvider>().isFavorite(widget.movie.id)
            ? Iconsax.heart5
            : Iconsax.heart,
        size: 24,
        color: Colors.red,
      ),
    );
  }
}