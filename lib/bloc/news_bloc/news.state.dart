import 'package:equatable/equatable.dart';
import 'package:meditationapp/models/news.dto.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsInitial extends NewsEvent {
  const NewsInitial();

  @override
  List<Object> get props => [];
}

class NewsLoaded extends NewsEvent {
  final List<Articles> data;

   const NewsLoaded(this.data);
  @override
  List<Object> get props => [data];
}
