class Comment {
  String? commentID;
  String? commentPostID;
  String? commentAuthor;
  String? commentAuthorEmail;
  String? commentAuthorUrl;
  String? commentAuthorIP;
  String? commentDate;
  String? commentDateGmt;
  String? commentContent;
  String? commentKarma;
  String? commentApproved;
  String? commentAgent;
  String? commentType;
  String? commentParent;
  String? userId;

  Comment(
      {this.commentID,
        this.commentPostID,
        this.commentAuthor,
        this.commentAuthorEmail,
        this.commentAuthorUrl,
        this.commentAuthorIP,
        this.commentDate,
        this.commentDateGmt,
        this.commentContent,
        this.commentKarma,
        this.commentApproved,
        this.commentAgent,
        this.commentType,
        this.commentParent,
        this.userId});

  Comment.fromJson(Map<String, dynamic> json) {
    commentID = json['comment_ID'];
    commentPostID = json['comment_post_ID'];
    commentAuthor = json['comment_author'];
    commentAuthorEmail = json['comment_author_email'];
    commentAuthorUrl = json['comment_author_url'];
    commentAuthorIP = json['comment_author_IP'];
    commentDate = json['comment_date'];
    commentDateGmt = json['comment_date_gmt'];
    commentContent = json['comment_content'];
    commentKarma = json['comment_karma'];
    commentApproved = json['comment_approved'];
    commentAgent = json['comment_agent'];
    commentType = json['comment_type'];
    commentParent = json['comment_parent'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_ID'] = this.commentID;
    data['comment_post_ID'] = this.commentPostID;
    data['comment_author'] = this.commentAuthor;
    data['comment_author_email'] = this.commentAuthorEmail;
    data['comment_author_url'] = this.commentAuthorUrl;
    data['comment_author_IP'] = this.commentAuthorIP;
    data['comment_date'] = this.commentDate;
    data['comment_date_gmt'] = this.commentDateGmt;
    data['comment_content'] = this.commentContent;
    data['comment_karma'] = this.commentKarma;
    data['comment_approved'] = this.commentApproved;
    data['comment_agent'] = this.commentAgent;
    data['comment_type'] = this.commentType;
    data['comment_parent'] = this.commentParent;
    data['user_id'] = this.userId;
    return data;
  }
}