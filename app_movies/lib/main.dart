import 'package:app_movies/pages/home_tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_movies/pages/favorite/favorites_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: HomeTabs(),
      ),
    );
  }
}
