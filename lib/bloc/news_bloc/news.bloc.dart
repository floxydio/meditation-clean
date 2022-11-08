import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditationapp/bloc/news_bloc/news.state.dart';
import 'package:meditationapp/repository/news.repository.dart';

class NewsCubit extends Cubit<NewsEvent> {
  NewsCubit() : super(const NewsInitial());

  void getNews() async {
    final news = await NewsRepository.getNews();
    emit(NewsLoaded(news));
  }
}
