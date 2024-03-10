import 'dlbox_item_model.dart';

class DlboxMoviesModel {
  List<DlboxItem>? subtitle;
  List<DlboxItem>? native;
  List<DlboxItem>? screen;
  List<DlboxItem>? dubbed;

  DlboxMoviesModel({this.subtitle});

  DlboxMoviesModel.fromJson(Map<String, dynamic> json) {
    if (json['subtitle'] != null) {
      subtitle = <DlboxItem>[];
      json['subtitle'].forEach((v) {
        subtitle!.add(new DlboxItem.fromJson(v));
      });
    }
    if (json['native'] != null) {
      native = <DlboxItem>[];
      json['native'].forEach((v) {
        native!.add(new DlboxItem.fromJson(v));
      });
    }
    if (json['screen'] != null) {
      screen = <DlboxItem>[];
      json['screen'].forEach((v) {
        screen!.add(new DlboxItem.fromJson(v));
      });
    }
    if (json['dubbed'] != null) {
      print("json is:${json}");
      dubbed = <DlboxItem>[];
      json['dubbed'].forEach((v) {
        dubbed!.add(new DlboxItem.fromJson(v));
      });
    }
  }
}
