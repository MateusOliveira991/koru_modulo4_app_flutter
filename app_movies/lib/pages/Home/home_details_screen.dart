import 'package:flutter/material.dart';

import 'package:app_movies/base/base_movies.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movie.movieBanner),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),
            // Movie information
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    movie.description,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Other information (you can add more fields here)
                  MovieInfoItem(
                    title: 'Diretor',
                    info: movie.director,
                  ),
                  MovieInfoItem(
                    title: 'Produtor',
                    info: movie.producer,
                  ),
                  MovieInfoItem(
                    title: 'Data de Lançamento',
                    info: movie.releaseDate,
                  ),
                  MovieInfoItem(
                    title: 'Duração',
                    info: movie.runningTime,
                  ),
                  MovieInfoItem(
                    title: 'Rotten Tomatoes',
                    info: '${movie.rtScore}%',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieInfoItem extends StatelessWidget {
  final String title;
  final String info;

  const MovieInfoItem({
    super.key,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bold title
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        // Grayed out info
        Text(
          info,
          style: const TextStyle(
            color: Colors.black38, // Slightly grayed out color
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
