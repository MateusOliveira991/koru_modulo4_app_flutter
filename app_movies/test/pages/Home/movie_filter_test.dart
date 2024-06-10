import 'package:app_movies/pages/Home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyHomePageState', () {
    test('filteredMovies retorna todos os filmes quando searchText está vazio',
        () {
      final state = MyHomePageState();
      state.searchText = '';
      expect(state.filteredMovies, equals(state.movies));
    });

    test('filteredMovies retorna apenas os filmes que contêm o searchText', () {
      final state = MyHomePageState();
      const searchText = 'some text';
      state.searchText = searchText;
      final filteredMovies = state.filteredMovies;
      for (final movie in filteredMovies) {
        expect(movie.title.toLowerCase(), contains(searchText.toLowerCase()));
      }
    });

    test(
        'filteredMovies retorna uma lista vazia quando nenhum título de filme contém o searchText',
        () {
      final state = MyHomePageState();
      const searchText = 'texto inexistente';
      state.searchText = searchText;
      final filteredMovies = state.filteredMovies;
      expect(filteredMovies, isEmpty);
    });
  });
}
