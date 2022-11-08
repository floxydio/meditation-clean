import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meditationapp/bloc/music_bloc/music.bloc.dart';
import 'package:meditationapp/bloc/music_bloc/music.state.dart';
import 'package:meditationapp/bloc/music_category_bloc/music_category.bloc.dart';
import 'package:meditationapp/bloc/music_category_bloc/music_category.state.dart';
import 'package:meditationapp/config/font.config.dart';
import 'package:meditationapp/presentasion/play/play_screen.dart';

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
    context.read<MusicCategory>().getMusic("Romance");
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
            Text("Recommended For You", style: FontConfig.fontSmall16.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 20,),
            BlocBuilder<MusicCubit, MusicEvent>(
              builder: (context, state) {
                if (state is MusicLoaded) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        for (int i = 0; i < state.musicData.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: InkWell(
                              onTap: () {
                                Get.to(PlayScreen(
                                    urlMusic: state.musicData[i].url,title: state.musicData[i].title,artist: state.musicData[i].artist, image: state.musicData[i].imageCard,));
                              },
                              child: SizedBox(
                                  width: 162,
                                  height: 161,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              state.musicData[i].imageCard
                                                  .toString(),
                                              width: 162,
                                              height: 113,
                                              fit: BoxFit.fill,
                                            )),
                                        const SizedBox(height: 10),
                                        Text(
                                          state.musicData[i].artist.toString(),
                                          style: FontConfig.fontLarge.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          state.musicData[i].title.toString(),
                                          style: FontConfig.fontSmall14
                                              .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54),
                                        )
                                      ])),
                            ),
                          ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            SizedBox(height:20)
              ,Text("Indonesia Banget", style: FontConfig.fontSmall16.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 20,),
            BlocBuilder<MusicCategory, MusicCategoryEvent>(
              builder: (context, stateCategory) {
                if (stateCategory is MusicCategoryLoaded) {
                        return  SingleChildScrollView(
                          
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                                                      for (int i = 0; i < stateCategory.musicData.length; i++)
                        
                              Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(PlayScreen(
                                          urlMusic: stateCategory.musicData[i].url,title: stateCategory.musicData[i].title,artist: stateCategory.musicData[i].artist, image: stateCategory.musicData[i].imageCard,));
                                    },
                                    child: SizedBox(
                                        width: 162,
                                        height: 161,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    stateCategory.musicData[i].imageCard
                                                        .toString(),
                                                    width: 162,
                                                    height: 113,
                                                    fit: BoxFit.fill,
                                                  )),
                                              const SizedBox(height: 10),
                                              Text(
                                                stateCategory.musicData[i].artist.toString(),
                                                style: FontConfig.fontLarge.copyWith(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                stateCategory.musicData[i].title.toString(),
                                                style: FontConfig.fontSmall14
                                                    .copyWith(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black54),
                                              )
                                            ])),
                                  ),
                                ),
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
