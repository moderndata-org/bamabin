class DlboxItem {
  String? season;
  String? episode;
  String? link;
  String? type;
  String? qualityCode;
  String? quality;
  String? encoder;
  String? subtitleType;
  double? size;
  String? hash;
  String? playStatus;
  String? originalQuality;

  DlboxItem(
      {this.season,
      this.episode,
      this.link,
      this.type,
      this.qualityCode,
      this.quality,
      this.encoder,
      this.subtitleType,
      this.size,
      this.hash,
      this.playStatus,
      this.originalQuality});

  DlboxItem.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    episode = json['episode'];
    link = json['link'];
    type = json['type'];
    qualityCode = json['quality_code'];
    quality = json['quality'];
    encoder = json['encoder'];
    subtitleType = json['subtitle_type'];
    hash = json['hash'];
    playStatus = json['play_status'];
    originalQuality = json['original_quality'];
    // size = double.tryParse(json['size']);
    size = double.tryParse(json['size'].toString());
    //! This is add by me
    originalQuality = quality;
    // print('runtimeType' + '${json['size'].runtimeType} : ${json['size']}');
    // if ((size is String && (size != '' || size != null)) || size is int) {
    //   size = double.parse(json['size']);
    //   print('runtimeType this');
    // } else if (size is double) {
    //   print('runtimeType that');
    //   size = json['size'];
    // } else {
    //   print('runtimeType those');
    //   size = 0;
    // }
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
    data['hash'] = this.hash;
    data['play_status'] = this.playStatus;
    data['original_quality'] = this.originalQuality;
    return data;
  }
}
