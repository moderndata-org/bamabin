class Actor {
  int? id;
  String? name;
  String? link;

  Actor(
      {this.id,
        this.name,
        this.link});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
  }


}