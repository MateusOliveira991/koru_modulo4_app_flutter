import 'package:flutter/material.dart';
import 'package:app_movies/core/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconsax/iconsax.dart';

import 'package:app_movies/base/base_movies.dart';
import 'package:app_movies/pages/Home/home_details_screen.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColors.backgroundColor,
            title: const Text(
              'Ghibli Stream',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 40,
                fontFamily: 'Merriweather',
                fontWeight: FontWeight.w900
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
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, 
                            horizontal: 20.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      'Mais populares',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                        color: AppColors.textColor
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: filteredMovies.length,
                    options: CarouselOptions(
                      height: 280,
                      viewportFraction: 0.5,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemBuilder: (BuildContext context, int index, int realIndex) {
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
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(movie.image),
                              fit: BoxFit.fill,
                            )),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      'Lista Completa',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                        color: AppColors.textColor
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = movies[index];
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
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColor
                                        ,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${movie.originalTitle}%",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${movie.releaseDate}",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Mulish',
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Rotten Tomatoes: ${movie.rtScore}%",
                                      style: TextStyle(
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
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(Iconsax.ticket),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Icon(Iconsax.save_2),
            ),
            label: '',
          ),
        ],
        selectedItemColor: Color(0xFFBCBCCD),
        unselectedItemColor: Color(0xFFBCBCCD),
      ),
    );
  }
}