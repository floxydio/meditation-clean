import 'package:equatable/equatable.dart';
import 'package:meditationapp/models/music.dto.dart';

abstract class MusicEvent extends Equatable {
  const MusicEvent();
}

class MusicInitial extends MusicEvent {
  const MusicInitial();

  @override
  List<Object> get props => [];
}

class MusicLoading extends MusicEvent {
  const MusicLoading();

  @override
  List<Object> get props => [];
}

class MusicLoaded extends MusicEvent {
  final List<MusicData> musicData;

  const MusicLoaded(this.musicData);

  @override
  List<Object> get props => [musicData];
}
