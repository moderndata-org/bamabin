class aboutUsModel {
  String? about;
  String? instagramPage;
  String? telegramChannel;

  aboutUsModel({this.about, this.instagramPage, this.telegramChannel});

  aboutUsModel.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    instagramPage = json['instagram_page'];
    telegramChannel = json['telegram_channel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['instagram_page'] = this.instagramPage;
    data['telegram_channel'] = this.telegramChannel;
    return data;
  }
}
