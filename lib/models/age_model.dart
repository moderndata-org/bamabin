class AgeRate{
  String? id;
  String? name;

  AgeRate({this.id, this.name});

  AgeRate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}