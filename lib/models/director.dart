class Director {
  int? id;
  String? name;
  String? link;

  Director(
      {this.id,
        this.name,
        this.link});

  Director.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
  }


}