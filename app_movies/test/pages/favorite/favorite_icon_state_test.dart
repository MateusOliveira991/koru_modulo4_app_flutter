import 'package:app_movies/models/movie.dart';
import 'package:app_movies/pages/favorite/favorite_icon_state.dart';
import 'package:app_movies/pages/favorite/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('FavoriteIconButton', () {
    testWidgets('deve renderizar corretamente', (tester) async {
      final movie = Movie(
        id: '1',
        title: 'Teste Mateus',
        originalTitle: 'Original Title',
        originalTitleRomanised: 'Original Title Romanised',
        image: 'image.jpg',
        movieBanner: 'banner.jpg',
        description: 'Movie Description',
        director: 'Movie Director',
        producer: 'Movie Producer',
        releaseDate: '2022-01-01',
        runningTime: '120 min',
        rtScore: '90',
        people: [],
        species: [],
        locations: [],
        vehicles: [],
        url: 'https://guibliapi.herokuapp.com/films/1',
      );
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<FavoritesProvider>(
            create: (_) => FavoritesProvider(),
            child: FavoriteIconButton(movie: movie),
          ),
        ),
      );

      expect(find.byType(FavoriteIconButton), findsOneWidget);
    });
  });
}
