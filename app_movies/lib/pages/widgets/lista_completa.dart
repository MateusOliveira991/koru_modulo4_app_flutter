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
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListTile(
          leading: SizedBox(
            width: 150,
            height: 250,
            child: ClipRRect(
              child: Image.network(
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
          padraoImage(context, AppImages.filme3),
          padraoImage(context, AppImages.filme4),
          padraoImage(context, AppImages.filme5),
          padraoImage(context, AppImages.filme6),
          padraoImage(context, AppImages.filme7),
          padraoImage(context, AppImages.filme8),
          padraoImage(context, AppImages.filme9),
          padraoImage(context, AppImages.filme10),
          padraoImage(context, AppImages.filme11),
          padraoImage(context, AppImages.filme12),
          padraoImage(context, AppImages.filme13),
          padraoImage(context, AppImages.filme14),
        ],
      ),
    );
  }
}
