import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Filmes e Séries',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> filmes = [
    "Aprika (2006)",
    "Atriz Milenar (2001)",
    "Contos de Terramar (2006)",
    "Demon Slayer - Mugen Train: O Filme (2020)",
    "Eu Posso Ouvir o Oceano (1993)",
    "Memórias de Ontem (1991)",
    "Meu Amigo Totoro (1988)",
    "Nausicaä do Vale do Vento",
    "O Castelo Animado (2004)",
    "O Castelo no Céu (1986)",
    "O Serviço de Entregas da Kiki (1989)",
    "Porco Rosso: O Último Herói Romântico (1992)",
    "Túmulo dos Vagalumes (1988)",
    "Uchuu Senkan Yamato 2205: Aratanaru Tabidachi - Koushou – Stasha (2022)",
    "LANÇAMENTO MUNDIAL: Overlord Movie 3: Sei Oukoku-hen (2024) Dirigido por: Naoyuki Itou - Ação Animação Anime Aventura Fantasia"
  ];

  final List<String> series = [
    "As Tartarugas Ninja",
    "Bob Esponja",
    "DuckTales – Os Caçadores de Aventura",
    "O Clube das Winx",
    "O Conto da Princesa Kaguya (2013)",
    "O Gato Retorna (2002)",
    "O Reino dos Gatos (2002)",
    "Rugrats: Os Anjinhos",
    "Scooby-Doo, Cadê Você?",
    "Sítio do Pica Pau Amarelo",
    "The Super Mario Bros. Super Show! Volume 2",
    "Undone"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmes e Séries'),
      ),
      body: ListView(
        children: [
          _buildSection('FILMES', filmes),
          _buildSection('SÉRIES', series),
        ],
      ),
    );
  }


  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}
