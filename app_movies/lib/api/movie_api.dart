import 'dart:convert';

import 'package:http/http.dart' as http;

import '/models/movie.dart';

class MovieApi {
  static Future<List<Movie>> fetchMovies() async {
    const baseUrl = 'https://ghibliapi.vercel.app/films';

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Movie> movies = data
          .map(
            (animeData) => Movie.fromJson(animeData),
          )
          .toList();

      return movies;
    } else {
      throw Exception('Could not retrieve data from api');
    }
  }
}
