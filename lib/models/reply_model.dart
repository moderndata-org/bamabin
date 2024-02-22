import 'package:shamsi_date/shamsi_date.dart';

class ReplyModel{
  String? id;
  String? content;
  String? _created_at;
  String? user_avatar;
  int? user_id;

  ReplyModel();

  ReplyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    _created_at = json['created_at'];
    user_avatar = json['user']["avatar"];
    user_id = json['user']["id"];

  }

  String get created_at {
    DateTime a = DateTime.parse(_created_at!);
    Jalali j = a.toJalali();
    return '${j.formatter.yyyy}/${j.formatter.mm}/${j.formatter.dd} ${a.hour.toString().padLeft(2, '0')}:${a.minute.toString().padLeft(2, '0')}';
  }

}