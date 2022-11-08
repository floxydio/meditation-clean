import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditationapp/bloc/news_bloc/news.bloc.dart';
import 'package:meditationapp/bloc/news_bloc/news.state.dart';
import 'package:meditationapp/config/font.config.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Berita Hari Ini",
                style: FontConfig.fontLarge
                    .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<NewsCubit, NewsEvent>(builder: (context, state) {
              if (state is NewsLoaded) {
                return ListView.builder(
                    itemCount: state.data.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, i) {
                      if (state.data[i].urlToImage != null) {
                        return ListTile(
                          leading: Image.network(
                            state.data[i].urlToImage.toString(),
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            state.data[i].title.toString(),
                            style: FontConfig.fontSmall16,
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
