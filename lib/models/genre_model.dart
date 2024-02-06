class Genre {
  int? id;
  String? name;
  String? link;
  String? icon;

  Genre({this.id, this.name, this.link,this.icon});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    data['icon'] = this.icon;
    return data;
  }
}