class Subtitle {
  String? season;
  String? episode;
  String? link;
  String? type;
  String? qualityCode;
  String? quality;
  String? encoder;
  String? subtitleType;
  String? size;
  String? playStatus;

  Subtitle(
      {this.season,
        this.episode,
        this.link,
        this.type,
        this.qualityCode,
        this.quality,
        this.encoder,
        this.subtitleType,
        this.size,
        this.playStatus});

  Subtitle.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    episode = json['episode'];
    link = json['link'];
    type = json['type'];
    qualityCode = json['quality_code'];
    quality = json['quality'];
    encoder = json['encoder'];
    subtitleType = json['subtitle_type'];
    size = json['size'];
    playStatus = json['play_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    data['episode'] = this.episode;
    data['link'] = this.link;
    data['type'] = this.type;
    data['quality_code'] = this.qualityCode;
    data['quality'] = this.quality;
    data['encoder'] = this.encoder;
    data['subtitle_type'] = this.subtitleType;
    data['size'] = this.size;
    data['play_status'] = this.playStatus;
    return data;
  }
}