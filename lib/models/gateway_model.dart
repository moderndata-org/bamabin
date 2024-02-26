class GatewayModel{
  int? id;
  String? name;
  String? icon;

  GatewayModel({this.id, this.name, this.icon});

  GatewayModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }
}