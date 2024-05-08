// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  "Castle in the Sky" 
  "My Neighbor Totoro",
  "Kiki's Delivery Service",
  "Only Yesterday",
  "Porco Rosso",
  "Pom Poko"
  "Whisper of the Heart",
  "Princess Mononoke",
  "My Neighbors the Yamadas",
  "The Cat Returns",
  "Howl's Moving Castle",
  "Tales from Earthsea",
  "Ponyo",
  "Arrietty",
  "From Up on Poppy Hill",
  "The Wind Rises",
  "The Tale of the Princess Kaguya"
  "When Marnie Was There",
  "The Red Turtle",
  "Earwig and the Witch",
];

  MyHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes e Series'),
      ),
      body: ListView(
        children: [
          _buildSection('FILMES', "filmes" as List<String>),
          _buildSection('SERIES', "series" as List<String>,
          ),
        ]
  }
  
         
  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

 
 // ignore: must_be_immutable, use_key_in_widget_constructors
 abstract class VideoScreen extends StatelessWidget {
  late final String videoId;

  
    dynamic ControlsDetails; appBar () {
        const Text('Video Player');
    dynamic; return;} 
      
    
}

YoutubePlayer(Required required, youtubePlayerController, {required controller, required bool showVideoProgressIndicator, required MaterialAccentColor progressIndicatorColor, required progressColors, required Null Function() onReady, required Null Function(dynamic metaData) onEnded}) {
}

class YoutubePlayerFlags {
  YoutubePlayerFlags({required bool autoplay, required bool mute, or, bool});
}

// ignore: camel_case_types
dynamic autoplay = autoplay; {

}
var mixin;
{
}


dynamic VideoScreenString; {
  String videoId{};(Action)
dynamic dynamic= VideoScreen(videoId: videoId = '14GZmJnwLuw') {
dynamic dynamic= VideoScreen(videoId: videoId); 
VideoScreen(videoId = 'K-PdbfkA7LM')
VideoScreen(videoId = 'K92a7Hj0ijLs')
VideoScreen(videoId = '4bG17OYs-GA')
VideoScreen(videoId = 'OfkQlZArxw0')
VideoScreen(videoId = '3LRyNwYg1f8')
VideoScreen(videoId = '_7cowIHjCD4')
VideoScreen(videoId = '0pVkiod6V0U')
VideoScreen(videoId = '4OiMOHRDs14')
VideoScreen(videoId = '1C9ujuCPlnY')
VideoScreen(videoId = 'Gp-H_YOcYTM')
VideoScreen(videoId = 'UwxatzcYf9Q')
VideoScreen(videoId = '8hxYx3Jq3kI')
VideoScreen(videoId = 'CsR3KVgBzSM')
VideoScreen(videoId = '9CtIXPhPo0g')
VideoScreen(videoId = '9nzpk_Br6yo')
VideoScreen(videoId = 'RzSpDgiF5y8')
VideoScreen(videoId = 'W71mtorCZD')
VideoScreen(videoId = 'jjmrxqcQdYg')
VideoScreen(videoId = 'Sw7BggqBpTk')
VideoScreen(videoId = '_PfhotgXEeQ')
VideoScreen(videoId = 'IiL-6sb4bs4')
VideoScreen(videoId = 'RlVrpa68E1s')
VideoScreen(videoId ='IVHObu-nAaI')
)
};
}
