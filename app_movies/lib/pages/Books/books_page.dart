import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/core/app_images.dart';
import 'package:app_movies/core/app_colors.dart';

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

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final List<Book> books = [
    Book(
      title: ' Princess Mononoke',
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
      title: " Castelo no Céu",
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
      title: " Meu Amigo Totoro",
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
      title: ' Ponyo',
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
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundColor,
              AppColors.backgroundColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final book in books)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                AppColors.accentColor,
                                AppColors.textColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds),
                            child: Text(
                              book.title,
                              style: const TextStyle(
                                color: AppColors.textColor,
                                fontFamily: 'Merriweather',
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 13)
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            book.image,
                            width: 110,
                            height: 140,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
                              child: Text(
                                book.description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
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
                                margin: const EdgeInsets.only(
                                    top: 0, bottom: 2, left: 20, right: 20),
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Center(
                        child: Text(
                          'R\$ ${book.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          width: 170,
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text('COMPRAR'),
                          ),
                        ),
                      ),
                  const Image(
        image: AssetImage("assets/images/nuvem.png"),
      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
