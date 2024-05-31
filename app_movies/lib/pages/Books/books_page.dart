import 'package:app_movies/pages/Home/home_page.dart';
import 'package:app_movies/pages/favorite/favorite_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/core/app_images.dart';
import 'package:app_movies/core/app_colors.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books Ghibli',
      home: BookPage(),
    );
  }
}

class Book {
  final String title;
  final double price;
  final String image;
  final String description;
  final List<String> images;

  Book({
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.images,
  });
}

class BookPage extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Princess Mononoke',
      price: 374.90,
      image: AppImages.livro1,
      description:
          'Toda a ideia inicial para o cinema é capturada aqui. Comentários, imagens coloridas, esboços, cenários, storyboards. Uma pérola para qualquer fã!',
      images: [
        AppImages.livro1_1,
        AppImages.livro1_2,
        AppImages.livro1_3,
        AppImages.livro1_1,
        AppImages.livro1_2,
        AppImages.livro1_3,
      ],
    ),
    Book(
      title: "Castelo no Céu",
      price: 246.90,
      image: AppImages.livro2,
      description:
          "O Castelo no Céu é um livro fantástico. Inclui entrevistas, esboços conceituais e células de animação do filme de estreia do estúdio japonês.",
      images: [
        AppImages.livro2_1,
        AppImages.livro2_2,
        AppImages.livro2_3,
        AppImages.livro2_1,
        AppImages.livro2_2,
        AppImages.livro2_3,
      ],
    ),
    Book(
      title: "Meu Amigo Totoro",
      price: 167.90,
      image: AppImages.livro3,
      description:
          "Este trabalho ricamente ilustrado contém esboços conceituais, design de personagens, cenários, pinturas e células de animação do filme.",
      images: [
        AppImages.livro3_1,
        AppImages.livro3_2,
        AppImages.livro3_3,
        AppImages.livro3_1,
        AppImages.livro3_2,
        AppImages.livro3_3,
      ],
    ),
    Book(
      title: 'Ponyo',
      price: 160.90,
      image: AppImages.livro4,
      description:
          'Ponyo. Vagamente baseado no conto “A Pequena Sereia”, de Hans Christian Andersen, este é um longa-metragem desenhado à mão.',
      images: [
        AppImages.livro4_1,
        AppImages.livro4_2,
        AppImages.livro4_3,
        AppImages.livro4_1,
        AppImages.livro4_2,
        AppImages.livro4_3,
      ],
    ),
    Book(
      title: "Castelo no Céu",
      price: 246.90,
      image: AppImages.livro2,
      description:
          "O Castelo no Céu é um livro fantástico. Inclui entrevistas, esboços conceituais e células de animação do filme de estreia do estúdio japonês.",
      images: [
        AppImages.livro2_1,
        AppImages.livro2_2,
        AppImages.livro2_3,
        AppImages.livro2_1,
        AppImages.livro2_2,
        AppImages.livro2_3,
      ],
    ),
    Book(
      title: "Meu Amigo Totoro",
      price: 167.90,
      image: AppImages.livro3,
      description:
          "Este trabalho ricamente ilustrado contém esboços conceituais, design de personagens, cenários, pinturas e células de animação do filme.",
      images: [
        AppImages.livro3_1,
        AppImages.livro3_2,
        AppImages.livro3_3,
        AppImages.livro3_1,
        AppImages.livro3_2,
        AppImages.livro3_3,
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: const IconThemeData(
          color: AppColors.iconColor,
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu_book,
              color: Color.fromARGB(255, 250, 249, 249),
            ),
            SizedBox(width: 8),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Text(
                'Books Ghibli',
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              Color.fromARGB(255, 4, 56, 89),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final book in books)
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            book.image,
                            width: 140,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 3),
                          Column(
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 9, 135, 66),
                                    Color.fromARGB(255, 229, 229, 229),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds),
                                child: Text(
                                  book.title,
                                  style: const TextStyle(
                                    color: AppColors.textColor,
                                    fontFamily: 'Merriweather',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'R\$ ${book.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(9.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1), //Descrição
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          book.description,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: book.images.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Sem estoque'),
                                  content: const Text(
                                      'Este livro está atualmente sem estoque.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Fechar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 0, 166, 126),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text('Comprar'),
                        ),
                      ),
                      const Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
            ],
          ),
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
