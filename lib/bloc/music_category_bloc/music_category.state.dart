import 'package:equatable/equatable.dart';
import 'package:meditationapp/models/music.dto.dart';

abstract class MusicCategoryEvent extends Equatable {
  const MusicCategoryEvent();
}

class MusicInitial extends MusicCategoryEvent {
  const MusicInitial();

  @override
  List<Object> get props => [];
}

class MusicLoading extends MusicCategoryEvent {
  const MusicLoading();

  @override
  List<Object> get props => [];
}

class MusicLoaded extends MusicCategoryEvent {
  final List<MusicData> musicData;

  const MusicLoaded(this.musicData);

  @override
  List<Object> get props => [musicData];
}
