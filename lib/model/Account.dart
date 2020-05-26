class Account {
  String avatar;
  String id;
  String phone;
  String screenName;

  Account({this.avatar, this.id, this.phone, this.screenName});

  Account.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    id = json['id'];
    phone = json['phone'];
    screenName = json['screenName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['screenName'] = this.screenName;
    return data;
  }
}