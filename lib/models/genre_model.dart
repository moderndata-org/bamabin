class Genre {
  int? id;
  String? name;
  String? link;

  Genre({this.id, this.name, this.link});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    return data;
  }
}