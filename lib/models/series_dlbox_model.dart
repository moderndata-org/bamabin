import 'package:bamabin/models/dlbox_item_model.dart';

class SeriesModel {
  InfoModel? info;
  Types? types;

  SeriesModel({this.info, this.types});

  SeriesModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new InfoModel.fromJson(json['info']) : null;
    types = json['types'] != null ? new Types.fromJson(json['types']) : null;
  }
}

class InfoModel {
  String? seasonKey;
  String? seasonName;

  InfoModel({this.seasonKey, this.seasonName});

  InfoModel.fromJson(Map<String, dynamic> json) {
    seasonKey = json['season_key'];
    seasonName = json['season_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season_key'] = this.seasonKey;
    data['season_name'] = this.seasonName;
    return data;
  }
}

class Types {
  List<SeasonBoxModel>? subtitle;
  List<SeasonBoxModel>? native;
  List<SeasonBoxModel>? screen;
  List<SeasonBoxModel>? dubbed;

  Types({this.subtitle});

  Types.fromJson(Map<String, dynamic> json) {
    if (json['subtitle'] != null) {
      subtitle = <SeasonBoxModel>[];
      json['subtitle'].forEach((v) {
        subtitle!.add(new SeasonBoxModel.fromJson(v));
      });
    }
    if (json['native'] != null) {
      native = <SeasonBoxModel>[];
      json['native'].forEach((v) {
        native!.add(new SeasonBoxModel.fromJson(v));
      });
    }
    if (json['screen'] != null) {
      screen = <SeasonBoxModel>[];
      json['screen'].forEach((v) {
        screen!.add(new SeasonBoxModel.fromJson(v));
      });
    }
    if (json['dubbed'] != null) {
      dubbed = <SeasonBoxModel>[];
      json['dubbed'].forEach((v) {
        dubbed!.add(new SeasonBoxModel.fromJson(v));
      });
    }
  }
}

class SeasonBoxModel {
  SeasonInfo? info;
  List<DlboxItem>? items;

  SeasonBoxModel({this.info, this.items});

  SeasonBoxModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new SeasonInfo.fromJson(json['info']) : null;
    if (json['items'] != null) {
      items = <DlboxItem>[];
      json['items'].forEach((v) {
        items!.add(new DlboxItem.fromJson(v));
      });
    }
  }
}

class SeasonInfo {
  int? size;
  String? qualityCode;
  String? quality;
  String? encoder;
  String? subtitleType;

  SeasonInfo(
      {this.size,
      this.qualityCode,
      this.quality,
      this.encoder,
      this.subtitleType});

  SeasonInfo.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    qualityCode = json['quality_code'];
    quality = json['quality'];
    encoder = json['encoder'];
    subtitleType = json['subtitle_type'];
  }
}
