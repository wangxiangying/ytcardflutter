import 'Carousel.dart';


class MyBanner implements ParseJson {
  String action;
  String banner;
  String createDateTime;
  int createTime;
  int id;
  String title;
  String updateDateTime;
  int updateTime;
  int weight;

  MyBanner(
      {this.action,
      this.banner,
      this.createDateTime,
      this.createTime,
      this.id,
      this.title,
      this.updateDateTime,
      this.updateTime,
      this.weight});

  @override
  ParseJson jsonParse(Map<String, dynamic> data) {
    return fromJson(data);
  }

   MyBanner fromJson(Map<String, dynamic> json) {
    action = json['action'];
    banner = json['banner'];
    createDateTime = json['createDateTime'];
    createTime = json['createTime'];
    id = json['id'];
    title = json['title'];
    updateDateTime = json['updateDateTime'];
    updateTime = json['updateTime'];
    weight = json['weight'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['banner'] = this.banner;
    data['createDateTime'] = this.createDateTime;
    data['createTime'] = this.createTime;
    data['id'] = this.id;
    data['title'] = this.title;
    data['updateDateTime'] = this.updateDateTime;
    data['updateTime'] = this.updateTime;
    data['weight'] = this.weight;
    return data;
  }
}
