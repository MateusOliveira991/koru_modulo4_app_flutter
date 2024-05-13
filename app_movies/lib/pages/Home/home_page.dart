import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconsax/iconsax.dart';

import 'package:app_movies/base/base_movies.dart';
import 'package:app_movies/core/app_colors.dart';
import 'package:app_movies/pages/Books/books_page.dart';
import 'package:app_movies/pages/Home/home_details_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchText = '';

  List<Movie> get filteredMovies {
    if (searchText.isEmpty) {
      return movies;
    } else {
      return movies
          .where((movie) =>
              movie.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: AppColors.backgroundColor,
            title: Text(
              'Ghibli Stream',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 40,
                fontFamily: 'Merriweather',
                fontWeight: FontWeight.w900,
              ),
            ),
            centerTitle: true,
            pinned: false,
          ),
          SliverToBoxAdapter(
            child: Container(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  if (searchText.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        'Mais populares',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Merriweather',
                          fontWeight: FontWeight.w900,
                          color: AppColors.textColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  if (searchText.isEmpty)
                    CarouselSlider.builder(
                      itemCount:
                          filteredMovies.length > 0 ? filteredMovies.length : 1,
                      options: CarouselOptions(
                        height: 280,
                        viewportFraction: 0.5,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        final movie = filteredMovies[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MovieDetailScreen(movie: movie),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(movie.image),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Lista Completa',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                        color: AppColors.textColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        filteredMovies.length > 0 ? filteredMovies.length : 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (filteredMovies.isEmpty) {
                        return Center(
                          child: Text("Nenhum filme encontrado"),
                        );
                      }
                      final movie = filteredMovies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MovieDetailScreen(movie: movie),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  movie.image,
                                  width: 100,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      movie.originalTitle,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      movie.releaseDate,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Rotten Tomatoes: ${movie.rtScore}%",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(Iconsax.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(Iconsax.ticket),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(Iconsax.book_1),
            ),
            label: 'Books',
          ),
        ],
        selectedItemColor: const Color(0xFFBCBCCD),
        unselectedItemColor: const Color(0xFFBCBCCD),
        onTap: (int index) {
          if (index == 2) {
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
