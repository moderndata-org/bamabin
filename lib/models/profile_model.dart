class ProfileModel {
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

  ProfileModel(
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

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
