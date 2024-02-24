import 'package:shamsi_date/shamsi_date.dart';

class MovieRequestModel {
  String? iD;
  String? userId;
  String? title;
  String? type;
  String? release;
  String? referralLink;
  String? message;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? id;
  // User? user;

  MovieRequestModel({
    this.iD,
    this.userId,
    this.title,
    this.type,
    this.release,
    this.referralLink,
    this.message,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  MovieRequestModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    userId = json['user_id'];
    title = json['title'];
    type = json['type'];
    release = json['release'];
    referralLink = json['referral_link'];
    message = json['message'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['release'] = this.release;
    data['referral_link'] = this.referralLink;
    data['message'] = this.message;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}
