import 'package:app_movies/pages/widgets/lista_populares.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/core/app_colors.dart';
import 'package:app_movies/pages/widgets/lista_completa.dart';
import 'package:iconsax/iconsax.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Container(
          padding: const EdgeInsets.only(left: 10.0),
          child: const Text(
            'Ghibli Stream',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 40,
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.w900
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
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
            const Padding(
              padding: EdgeInsets.all(20),
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
            const ListaFilmes(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Lista completa',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                      color: AppColors.textColor
                      ),
                    textAlign: TextAlign.left,
                    
                  ),
                ),
              ],
            ),
            ListaCompleta(),
          ],
        ),
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
