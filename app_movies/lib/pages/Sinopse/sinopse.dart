import 'package:flutter/material.dart';

class Sinopse extends StatelessWidget {
 

  const Sinopse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sinopse'),
      ),
      body: const Center(
        child: Text(
          'Sinopse:',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
