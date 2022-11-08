import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditationapp/config/font.config.dart';

class PlayScreen extends StatefulWidget {
  final String? urlMusic;
  final String? title;
  final String? artist;
  final String? image;
  const PlayScreen(
      {Key? key,
      required this.urlMusic,
      required this.image,
      required this.title,
      required this.artist})
      : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer
        .setAudioSource(AudioSource.uri(
          Uri.parse(widget.urlMusic.toString()),
        ))
        // ignore: avoid_print
        .catchError((error) => print("Error: $error"));

    audioPlayer.play();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // StreamBuilder<bool>(
            //   stream: audioPlayer.shuffleModeEnabledStream,
            //   builder: (context, snapshot) {
            //     return _shuffleButton(context, snapshot.data ?? false);
            //   },
            // ),
            StreamBuilder<SequenceState?>(
              stream: audioPlayer.sequenceStateStream,
              builder: (_, __) {
                return IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () async {
                    //audio previous 15seconds
                    audioPlayer.seek(
                        Duration(seconds: audioPlayer.position.inSeconds - 3));
                  },
                );
              },
            ),
            StreamBuilder<PlayerState>(
              stream: audioPlayer.playerStateStream,
              builder: (_, snapshot) {
                final playerState = snapshot.data;
                return _playPauseButton(playerState);
              },
            ),
            StreamBuilder<SequenceState?>(
              stream: audioPlayer.sequenceStateStream,
              builder: (_, __) {
                return IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () async {
                    //audio previous 15seconds
                    audioPlayer.seek(
                        Duration(seconds: audioPlayer.position.inSeconds + 10));
                  },
                );
              },
            ),
            StreamBuilder<LoopMode>(
              stream: audioPlayer.loopModeStream,
              builder: (context, snapshot) {
                return _repeatButton(context, snapshot.data ?? LoopMode.off);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                top: 20,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        widget.artist.toString(),
                        style: FontConfig.fontLarge
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(widget.title.toString(),
                          style: FontConfig.fontSmall14Medium.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                    ],
                  ),
                )),
            Positioned.fill(
                child: Align(
              alignment: Alignment.center,
              child: Image.network(
                widget.image.toString(),
                fit: BoxFit.fill,
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _playPauseButton(PlayerState? playerState) {
    final processingState = playerState?.processingState;
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        width: 64.0,
        height: 64.0,
        child: const CircularProgressIndicator(),
      );
    } else if (audioPlayer.playing != true) {
      return IconButton(
        icon: const Icon(Icons.play_arrow),
        iconSize: 64.0,
        onPressed: audioPlayer.play,
      );
    } else if (processingState != ProcessingState.completed) {
      return IconButton(
        icon: const Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: audioPlayer.pause,
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.replay),
        iconSize: 64.0,
        onPressed: () => audioPlayer.seek(Duration.zero,
            index: audioPlayer.effectiveIndices!.first),
      );
    }
  }

  Widget _shuffleButton(BuildContext context, bool isEnabled) {
    return IconButton(
      icon: isEnabled
          ? Icon(Icons.shuffle, color: Theme.of(context).accentColor)
          : const Icon(Icons.shuffle),
      onPressed: () async {
        final enable = !isEnabled;
        if (enable) {
          await audioPlayer.shuffle();
        }
        await audioPlayer.setShuffleModeEnabled(enable);
      },
    );
  }

  Widget _nextButton() {
    return IconButton(
      icon: const Icon(Icons.skip_next),
      onPressed: audioPlayer.hasNext ? audioPlayer.seekToNext : null,
    );
  }

  Widget _repeatButton(BuildContext context, LoopMode loopMode) {
    final icons = [
      const Icon(Icons.repeat),
      Icon(Icons.repeat, color: Theme.of(context).accentColor),
      Icon(Icons.repeat_one, color: Theme.of(context).accentColor),
    ];
    const cycleModes = [
      LoopMode.off,
      LoopMode.all,
      LoopMode.one,
    ];
    final index = cycleModes.indexOf(loopMode);
    return IconButton(
      icon: icons[index],
      onPressed: () {
        audioPlayer.setLoopMode(
            cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
      },
    );
  }
}
