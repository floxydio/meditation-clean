import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


class PlayMusicScreeen extends StatefulWidget {
  const PlayMusicScreeen({Key? key}) : super(key: key);

  @override
  State<PlayMusicScreeen> createState() => _PlayMusicScreeenState();
}

class _PlayMusicScreeenState extends State<PlayMusicScreeen> {
  AudioPlayer? audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    audioPlayer?.setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse("http://172.17.144.1:3000/storage/music/aerie.mp3"))
    ])).catchError((error) {
      print("An error occured $error");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer?.dispose();  
    
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:Column(children: [
        ElevatedButton(onPressed: (){
          audioPlayer?.play();
        } , child: const Text("Play Music"))
      ],)),
    );

  }
}