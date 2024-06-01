import 'package:app_movies/pages/Books/books_page.dart';
import 'package:app_movies/pages/Home/home_page.dart';
import 'package:app_movies/pages/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() { setState(() {}); //Sempre que tiver uma atualização, o setState é chamado, a tela é atualizada
    
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        // physics: const NeverScrollableScrollPhysics(), //Bloqueia o scroll horizontal
        controller: _tabController,
        children: const [
          MyHomePage(),
          FavoriteScreen(),
          BookPage(),
        ],
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
        selectedItemColor: const Color.fromARGB(255, 228, 17, 17),
        unselectedItemColor: const Color.fromARGB(255, 51, 51, 51),
        currentIndex: _tabController.index,
        onTap: (int index) {
          setState(() {
            _tabController.animateTo(index);
          });
        },
      ),
    );
  }
}
