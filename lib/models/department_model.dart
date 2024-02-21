class DepartmentModel{
  String? id;
  String? name;


  DepartmentModel({this.id, this.name});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}