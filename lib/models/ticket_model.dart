class TicketModel{
  String? id;
  String? user_id;
  String? title;
  String? department;
  String? status;
  String? created_at;
  String? updated_at;

  TicketModel({this.id, this.user_id, this.title, this.department, this.status,
      this.created_at, this.updated_at});

  TicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    title = json['title'];
    department = json['department'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }
}