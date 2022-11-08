import 'package:flutter/material.dart';
import 'package:meditationapp/presentasion/play/screens/playmusic.screen.dart';
class PlayMain extends StatefulWidget {
  const PlayMain({Key? key}) : super(key: key);

  @override
  State<PlayMain> createState() => _PlayMainState();
}

class _PlayMainState extends State<PlayMain> {
  @override
  Widget build(BuildContext context) {
    return PlayMusicScreeen();   
  }
}