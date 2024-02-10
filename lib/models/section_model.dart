import 'package:bamabin/models/film_model.dart';
import 'genre_model.dart';

class SectionModel {
  int? id;
  String? type;
  String? name;
  String? icon;
  String? link;
  String? taxonomy;
  int? limit;
  List<FilmModel>? posts;
  List<Genre>? genres;
  List<dynamic>? post_type;
  FilmModel? post;


  SectionModel(
      {this.id,
        this.type,
        this.name,
        this.icon,
        this.link,
        this.limit,
        this.posts,
        this.taxonomy,
        this.genres,
        this.post_type,
        this.post,});

  SectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    icon = json['icon'];
    link = json['link'];
    limit = json['limit'];
    post_type = json['post_type'];
    taxonomy = json['taxonomy'];
    if (json['posts'] != null) {
      posts = <FilmModel>[];
      json['posts'].forEach((v) {
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


