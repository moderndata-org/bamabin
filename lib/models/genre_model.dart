class Genre {
  int? id;
  String? name;
  String? link;
  String? icon;
  String? background_url;

  Genre({this.id, this.name, this.link,this.icon,this.background_url});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    icon = json['icon'];
    background_url = json['background_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    data['icon'] = this.icon;
    data['background_url'] = this.background_url;
    return data;
  }
}