import 'package:shamsi_date/shamsi_date.dart';

class OrderListModel {
  String? iD;
  String? userId;
  String? title;
  String? type;
  String? items;
  String? content;
  String? createdAt;
  String? id;
  User? user;
  String? persianDate;
  // List<Null>? posts;

  OrderListModel({
    this.iD,
    this.userId,
    this.title,
    this.type,
    this.items,
    this.content,
    this.createdAt,
    this.id,
    this.user,
    // this.posts
  });

  OrderListModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    userId = json['user_id'];
    title = json['title'];
    type = json['type'];
    items = json['items'];
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (createdAt != null) {
      DateTime a = DateTime.parse(createdAt!);
      DateTime b = DateTime(a.year, a.month, a.day);
      print(a);
      Jalali j = a.toJalali();
      print(b);
      print(j);
      persianDate =
          '${j.year}/${j.month.toString().padLeft(2, '0')}/${j.day.toString().padLeft(2, '0')}';
    }
    // if (json['posts'] != null) {
    //   posts = <Null>[];
    //   json['posts'].forEach((v) {
    //     posts!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['items'] = this.items;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    // if (this.posts != null) {
    // data['posts'] = this.posts!.map((v) => v?.toJson()).toList();
    // }
    return data;
  }
}

class User {
  int? id;
  String? avatar;
  String? firstName;
  String? lastName;
  String? nickname;
  String? username;
  String? email;
  String? description;
  String? phone;
  String? city;

  User(
      {this.id,
      this.avatar,
      this.firstName,
      this.lastName,
      this.nickname,
      this.username,
      this.email,
      this.description,
      this.phone,
      this.city});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    nickname = json['nickname'];
    username = json['username'];
    email = json['email'];
    description = json['description'];
    phone = json['phone'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['nickname'] = this.nickname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['city'] = this.city;
    return data;
  }
}
