import 'package:flutter/material.dart';
import 'package:app_movies/core/app_colors.dart';
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
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: const Text(
          'Detalhes do Filme',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.w900,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.iconColor,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Container(
                  height: 75,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.backgroundColor,
                        AppColors.accentColor,
                        AppColors.accentColor,
                        AppColors.backgroundColor,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 24,
                            color: AppColors.textColorBlack,
                            fontFamily: 'Merriweather',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.bookmark_border_outlined,
                          color: AppColors.iconColorBlack,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 10, right: 20, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieInfoItem(
                        title: 'Rotten Tomatoes',
                        info: '⭐  ${movie.rtScore}%',
                      ),

                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.textColorBlack,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              'FANTASIA',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.textColorBlack,
                              borderRadius: BorderRadius.circular(
                                  50), // Adiciona um BorderRadius de 50px
                            ),
                            child: const Text(
                              'AVENTURA',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24)
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Sinopse:",
                        style: TextStyle(
                          fontSize: 23,
                          color: AppColors.textColor,
                          fontFamily: 'Merriweather',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                          height:
                              8), // Adiciona um espaço vertical entre os textos
                      Text(
                        movie.description,
                        style: const TextStyle(
                          fontSize: 17,
                          color: AppColors.textColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                      info: "${movie.runningTime} min",
                                    ),
                                  ]),
                              const SizedBox(width: 40),
                              Image.asset(
                                'assets/images/jiji.png',
                                width: 140,
                                height: 240,
                                fit: BoxFit.cover,
                              ),
                            ]),
                          ]),
                    ]),
              ),
            ])
          ]),
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
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.w900,
            color: AppColors.textColor,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
