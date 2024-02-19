class NotificationModel{
  String? id;
  String? title;
  String? content;
  bool? readStatus;
  String? createdAt;
  String? readAt;

  NotificationModel(
      {this.id,
        this.title,
        this.content,
        this.readStatus,
        this.createdAt,
        this.readAt}); 

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
    readAt = json['read_at'];
  }
}