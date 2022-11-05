import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditationapp/bloc/music_bloc/music.bloc.dart';
import 'package:meditationapp/bloc/music_category_bloc/music_category.bloc.dart';
import 'package:meditationapp/bloc/music_category_bloc/music_category.state.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<MusicCubit>().getMusic();
    context.read<MusicCategory>().getMusic("Relaxing");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                "assets/image/logo.png",
                color: Colors.black,
                width: 168,
                height: 30,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text("Good Morning, Dio",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            const Text("We wish you have a good day",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54)),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<MusicCategory, MusicCategoryEvent>(
              builder: (context, state) {
                if (state is MusicLoaded) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var i = 0; i < state.musicData.length; i++)
                          Container(
                            height: 210,
                            width: 177,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(int.parse(
                                  state.musicData[i].colorCard.toString())),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Image.network(
                                        state.musicData[i].imageCard.toString(),
                                        height: 140,
                                      )),
                                  Text(state.musicData[i].title.toString()),
                                ]),
                          )
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ]),
        ),
      )),
    );
  }
}
