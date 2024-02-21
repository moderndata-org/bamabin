import 'package:shamsi_date/shamsi_date.dart';

class TicketModel {
  String? id;
  String? user_id;
  String? title;
  String? department;
  String? status;
  String? department_name;
  String? _created_at;
  String? _updated_at;

  TicketModel();

  TicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    title = json['title'];
    department = json['department'];
    status = json['status'];
    department_name = json['department_name'];
    _created_at = json['created_at'];
    _updated_at = json['updated_at'];
  }

  String get created_at {
    DateTime a = DateTime.parse(_created_at!);
    Jalali j = a.toJalali();
    return '${j.formatter.yyyy}/${j.formatter.mm}/${j.formatter.dd} ${a.hour.toString().padLeft(2, '0')}:${a.minute.toString().padLeft(2, '0')}';
  }

  String get updated_at {
    DateTime a = DateTime.parse(_updated_at!);
    Jalali j = a.toJalali();
    return '${j.formatter.yyyy}/${j.formatter.mm}/${j.formatter.dd} ${a.hour.toString().padLeft(2, '0')}:${a.minute.toString().padLeft(2, '0')}';
  }
}
