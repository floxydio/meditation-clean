import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditationapp/bloc/music_bloc/music.state.dart';
import 'package:meditationapp/repository/music.repository.dart';

class MusicCubit extends Cubit<MusicEvent> {
  MusicCubit() : super(const MusicInitial());

  void getMusic() async {
    final music = await MusicRepository.getMusics();
    emit(MusicLoaded(music));
  }
}
