import 'package:dio/dio.dart';
import 'package:meditationapp/models/music.dto.dart';

class MusicRepository {
  static Future<List<MusicData>> getMusics() async {
    var response = await Dio().get("http://192.168.43.38:3000/music",
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ));
        
            print(response.data);
    List resbody = response.data["data"] as List;
    return resbody.map((e) => MusicData.fromJson(e)).toList();
  }

  static Future<List<MusicData>> getMusicsByCategory(String category) async {
    var response =
        await Dio().get("http://192.168.43.38:3000/music-category/$category",
            options: Options(
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            ));

            print(response.data);
    List resbody = response.data["data"] as List;
    return resbody.map((e) => MusicData.fromJson(e)).toList();
  }
}
