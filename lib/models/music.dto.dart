class Music {
  List<MusicData>? data;
  String? message;
  int? status;

  Music({this.data, this.message, this.status});

  Music.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MusicData>[];
      json['data'].forEach((v) {
        data!.add(MusicData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class MusicData {
  int? id;
  String? title;
  String? artist;
  String? url;
  String? category;
  String? colorCard;
  String? imageCard;

  MusicData(
      {this.id,
      this.title,
      this.artist,
      this.url,
      this.category,
      this.colorCard,
      this.imageCard});

  MusicData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    artist = json['artist'];
    url = json['url'];
    category = json['category'];
    colorCard = json['color_card'];
    imageCard = json['image_card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['artist'] = artist;
    data['url'] = url;
    data['category'] = category;
    data['color_card'] = colorCard;
    data['image_card'] = imageCard;
    return data;
  }
}
