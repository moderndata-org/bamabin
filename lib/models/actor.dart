class Actor {
  int? id;
  String? name;
  String? link;
  String? avatar;
  bool? is_star;

  Actor(
      {this.id,
        this.name,
        this.avatar,
        this.is_star,
        this.link});

  Actor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    avatar = json['avatar'];
    is_star = json['is_star'];
  }


}