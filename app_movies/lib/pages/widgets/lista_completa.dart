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
          MaterialPageRoute(builder: (context) => const Sinopse()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: 100,
          height: 150,
          margin: const EdgeInsets.only(left: 15.0), 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), 
            image: DecorationImage(
              image: NetworkImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
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