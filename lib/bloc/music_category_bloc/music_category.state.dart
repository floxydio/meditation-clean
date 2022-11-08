import 'package:equatable/equatable.dart';
import 'package:meditationapp/models/music.dto.dart';

abstract class MusicCategoryEvent extends Equatable {
  const MusicCategoryEvent();
}

class MusicCategoryInitial extends MusicCategoryEvent {
  const MusicCategoryInitial();

  @override
  List<Object> get props => [];
}

class MusicCategoryLoading extends MusicCategoryEvent {
  const MusicCategoryLoading();

  @override
  List<Object> get props => [];
}

class MusicCategoryLoaded extends MusicCategoryEvent {
  final List<MusicData> musicData;

  const MusicCategoryLoaded(this.musicData);

  @override
  List<Object> get props => [musicData];
}
