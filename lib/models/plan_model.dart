class PlanModel {
  String? id;
  String? name;
  String? time;
  String? price;
  String? discountPrice;
  String? special;
  String? iconUrl;

  PlanModel(
      {this.id,
        this.name,
        this.time,
        this.price,
        this.discountPrice,
        this.special,
        this.iconUrl});

  PlanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    price = json['price'];
    discountPrice = json['discount_price'];
    special = json['special'];
    iconUrl = json['icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time'] = this.time;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['special'] = this.special;
    data['icon_url'] = this.iconUrl;
    return data;
  }
}