import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditationapp/bloc/news_bloc/news.bloc.dart';
import 'package:meditationapp/presentasion/news/screens/news.screen.dart';

class NewsMain extends StatelessWidget {
  const NewsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(),
      child: const NewsScreen(),
    );
  }
}
