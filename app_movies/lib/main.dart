// ignore_for_file: non_constant_identifier_names

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

  final List<String> series = <String>[
title: "Castle in the Sky" 
title: "My Neighbor Totoro",
title: "Kiki's Delivery Service",
title: "Only Yesterday",
title: "Porco Rosso",
title: "Pom Poko"
title: "Whisper of the Heart",
title: "Princess Mononoke",
title: "My Neighbors the Yamadas",
title: "The Cat Returns",
title: "Howl's Moving Castle",
title: "Tales from Earthsea",
title: "Ponyo",
title: "Arrietty",
title: "From Up on Poppy Hill",
title: "The Wind Rises",
title: "The Tale of the Princess Kaguya"
title: "When Marnie Was There",
title: "The Red Turtle",
title: "Earwig and the Witch",
title: Senna,
title: Mundo Sitio do Picapau,
title: Shrek5

  ];
  
  mixin title {
  }

  @override
  Widget build(BuildContext context) {
    List<String> filmes;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes e Séries'),
      ),
      body: ListView(
        children: [
          _buildSection('FILMES', "filmes" as List<String>),
          _buildSection('SÉRIES', series),
        ],
      )
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

 
 class VideoScreen extends StatelessWidget {
  late final String videoId;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    ListBody or;
    var youtubePlayerFlags4 = YoutubePlayerFlags (
            autoplay: true,
              mute: false,
                var ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return ;
                  },
                ), youtubePlayerFlags3 = youtubePlayerFlags4;
    var youtubePlayerFlags2 = youtubePlayerFlags3;
            var youtubePlayerFlags = youtubePlayerFlags2;
    var VideoId;
    var expectade;
    var youtubePlayerController = YoutubePlayerController( 
            // ignore: cast_from_nullable_always_fails
            RequestAnimationFrameCallback dynamic VideoId as Type Type: null, VideoId: null, initialVideoId: null, flags: null: YoutubePlayerController,
            flags: youtubePlayerFlags, Type: null, initialVideoId: Type: Null; 
          );
    );
  }
 }
    dynamic ControlsDetails; appBar () {
        title: const Text('Video Player');
    dynamic; return; Scaffold( 
      appBar = appBar,
      body = Center(
        child: YoutubePlayer(
          required youtubePlayerController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors: const ProgressBarColors(
            playedColor: Colors.blue,
            handleColor: Colors.blueAccent,
          ),
          onReady: () {
            // Adicionar ações ao vídeo estar pronto
          },
  
          onEnded: (metaData) {
            // Adicionar ações ao vídeo terminar
        , controller: null,, controller: null,, controller: null,, controller: null,, controller: null,, controller: null,, controller: null,, controller: null,)
        ),
      } as ControlsDetails,
      }
  

class YoutubePlayerController {
  // ignore: avoid_types_as_parameter_names
  YoutubePlayerController(Type initialVideoId, Type VideoId, Type type, expectade, Type videoId, {required Type, String? videoId, required YoutubePlayerFlags flags, required Type initialVideoId, required Type VideoId,});
}

YoutubePlayer(Required required, youtubePlayerController, {required controller, required bool showVideoProgressIndicator, required MaterialAccentColor progressIndicatorColor, required progressColors, required Null Function() onReady, required Null Function(dynamic metaData) onEnded}) {
}

class YoutubePlayerFlags {
  YoutubePlayerFlags({required bool autoplay, required bool mute, or, bool});
}

// ignore: camel_case_types
dynamic autoplay = autoplay; {

}

dynamic VideoScreenString; {
  String videoId{};
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
);

mixin youtubePlayerController {
}
)
}
}