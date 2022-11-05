import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditationapp/bloc/music_category_bloc/music_category.state.dart';
import 'package:meditationapp/repository/music.repository.dart';

class MusicCategory extends Cubit<MusicCategoryEvent> {
  MusicCategory() : super(const MusicInitial());

  void getMusic(String category) async {
    final music = await MusicRepository.getMusicsByCategory(category);
    emit(MusicLoaded(music));
  }
}
