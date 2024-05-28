import 'package:app_movies/pages/Login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Verifique se esta linha está presente
import 'package:app_movies/pages/favorite/favorites_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: LoginPage(),
      ),
    );
  }
}
