import 'package:app_movies/pages/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Verifique se esta linha está presente
import 'package:app_movies/core/app_widget.dart';
import 'package:app_movies/pages/favorite/favorite_screen.dart';
import 'package:app_movies/providers/favorites_provider.dart';
import 'package:app_movies/pages/Home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: MaterialApp(
        title: 'My App',
        home: LoginPage(),
      ),
    );
  }
}