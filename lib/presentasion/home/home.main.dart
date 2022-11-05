import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditationapp/bloc/music_bloc/music.bloc.dart';
import 'package:meditationapp/bloc/music_category_bloc/music_category.bloc.dart';
import 'package:meditationapp/presentasion/home/screens/home.screen.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => MusicCubit()),BlocProvider(create: (_) => MusicCategory())],
        child: const Home());
  }
}
