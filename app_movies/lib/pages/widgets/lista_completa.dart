import 'package:app_movies/pages/Sinopse/sinopse.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/core/app_images.dart';

class ListaCompleta extends StatelessWidget {
  const ListaCompleta({Key? key}) : super(key: key);

  Widget padraoImage(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sinopse()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: SizedBox(
            
            child: ClipRRect(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        children: <Widget>[
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme2),
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme2),
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme2),
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme2),
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme2),
        ],
      ),
    );
  }
}