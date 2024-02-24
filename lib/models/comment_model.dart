class CommentModel {
  String? id;
  String? postId;
  String? postTitle;
  String? postLink;
  String? author;
  String? email;
  String? createdAt;
  String? convertedCreatedAt;
  String? content;
  String? status;
  String? parentId;
  String? userId;
  String? avatar;
  LikeInfo? likeInfo;
  bool? hasSpoil;

  CommentModel(
      {this.id,
      this.postId,
      this.postTitle,
      this.postLink,
      this.author,
      this.email,
      this.createdAt,
      this.convertedCreatedAt,
      this.content,
      this.status,
      this.parentId,
      this.userId,
      this.avatar,
      this.likeInfo,
      this.hasSpoil});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    postTitle = json['post_title'];
    postLink = json['post_link'];
    author = json['author'];
    email = json['email'];
    createdAt = json['created_at'];
    convertedCreatedAt = json['converted_created_at'];
    content = json['content'];
    status = json['status'];
    parentId = json['parent_id'];
    userId = json['user_id'];
    avatar = json['avatar'];
    likeInfo = json['like_info'] != null
        ? new LikeInfo.fromJson(json['like_info'])
        : null;
    hasSpoil = json['has_spoil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['post_title'] = this.postTitle;
    data['post_link'] = this.postLink;
    data['author'] = this.author;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['converted_created_at'] = this.convertedCreatedAt;
    data['content'] = this.content;
    data['status'] = this.status;
    data['parent_id'] = this.parentId;
    data['user_id'] = this.userId;
    data['avatar'] = this.avatar;
    if (this.likeInfo != null) {
      data['like_info'] = this.likeInfo!.toJson();
    }
    data['has_spoil'] = this.hasSpoil;
    return data;
  }
}

class LikeInfo {
  int? likes;
  int? dislikes;
  int? likePercent;
  int? dislikePercent;
  int? total;

  LikeInfo(
      {this.likes,
      this.dislikes,
      this.likePercent,
      this.dislikePercent,
      this.total});

  LikeInfo.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
    likePercent = json['like_percent'];
    dislikePercent = json['dislike_percent'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['like_percent'] = this.likePercent;
    data['dislike_percent'] = this.dislikePercent;
    data['total'] = this.total;
    return data;
  }
}
