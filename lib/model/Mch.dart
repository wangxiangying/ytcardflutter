

class Mch {
  String address;
  double avg;
  String contact;
  String id;
  String logo;
  String mchid;
  String name;
  String qrCodeContent;
  String region;
  int star;
  String status;
  String tags;
  String telephone;
  bool voiceRemindSwitch;

  Mch(
      {this.address,
        this.avg,
        this.contact,
        this.id,
        this.logo,
        this.mchid,
        this.name,
        this.qrCodeContent,
        this.region,
        this.star,
        this.status,
        this.tags,
        this.telephone,
        this.voiceRemindSwitch});

  Mch.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    avg = json['avg'];
    contact = json['contact'];
    id = json['id'];
    logo = json['logo'];
    mchid = json['mchid'];
    name = json['name'];
    qrCodeContent = json['qrCodeContent'];
    region = json['region'];
    star = json['star'];
    status = json['status'];
    tags = json['tags'];
    telephone = json['telephone'];
    voiceRemindSwitch = json['voiceRemindSwitch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['avg'] = this.avg;
    data['contact'] = this.contact;
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['mchid'] = this.mchid;
    data['name'] = this.name;
    data['qrCodeContent'] = this.qrCodeContent;
    data['region'] = this.region;
    data['star'] = this.star;
    data['status'] = this.status;
    data['tags'] = this.tags;
    data['telephone'] = this.telephone;
    data['voiceRemindSwitch'] = this.voiceRemindSwitch;
    return data;
  }
}