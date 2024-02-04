import 'package:bamabin/models/film_model.dart';
import 'genre_model.dart';

class SectionModel {
  int? id;
  String? type;
  String? name;
  String? icon;
  String? link;
  String? limit;
  List<FilmModel>? posts;
  List<Genre>? genres;
  FilmModel? post;


  SectionModel(
      {this.id,
        this.type,
        this.name,
        this.icon,
        this.link,
        this.limit,
        this.posts,
        this.genres,
        this.post,});

  SectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    icon = json['icon'];
    link = json['link'];
    limit = json['limit'];
    if (json['posts'] != null) {
      posts = <FilmModel>[];
      json['comments'].forEach((v) {
        posts!.add(new FilmModel.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genre>[];
      json['genres'].forEach((v) {
        genres!.add(new Genre.fromJson(v));
      });
    }
    if (json['post'] != null) {

        post = FilmModel.fromJson(json['post']);
    }

  }

}


