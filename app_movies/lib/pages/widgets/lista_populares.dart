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
        height: 130,
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0,),
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
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
          padraoImage(context, AppImages.filme3),
          padraoImage(context, AppImages.filme4),
          padraoImage(context, AppImages.filme5),
          padraoImage(context, AppImages.filme6),
          padraoImage(context, AppImages.filme7),
          padraoImage(context, AppImages.filme8),
          padraoImage(context, AppImages.filme9),
          padraoImage(context, AppImages.filme10),
        ],
      ),
    );
  }
}
