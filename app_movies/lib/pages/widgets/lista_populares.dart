import 'package:app_movies/pages/Sinopse/sinopse.dart';
import 'package:flutter/material.dart';
import 'package:app_movies/core/app_images.dart';


class ListaFilmes extends StatelessWidget {
  const ListaFilmes({Key? key}) : super(key: key);

  Widget padraoImage(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sinopse()), 
        );
      },
      child: SizedBox(
        width: 150,
        height: 140,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme2),
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme2),
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme2),
          padraoImage(context, AppImages.filme1),
          padraoImage(context, AppImages.filme2),
          padraoImage(context, AppImages.filme1),
        ],
      ),
    );
  }
}
