import 'package:flutter/material.dart';
import 'package:app_movies/pages/Home/home_page.dart';
// import 'package:app_movies/pages/Sinopse/sinopse.dart';
import 'package:app_movies/pages/Books/books_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyHomePage(),
        // '/sinopse': (context) => const Sinopse(),
        '/books': (context) => BookPage(),
      },
    );
  }
}
