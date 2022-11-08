import 'package:dio/dio.dart';
import 'package:meditationapp/models/news.dto.dart';

class NewsRepository {
  static Future<List<Articles>> getNews() async {
    var keys = "788d81ce1b264bd590286386745d90fc";
    var response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=id&sortBy=publishedAt&apiKey=$keys");
    List resbody = response.data["articles"] as List;
    return resbody.map((e) => Articles.fromJson(e)).toList();
  }
}
