import 'Account.dart';
import 'Carousel.dart';
import 'Mch.dart';

class LoginModel extends NetData<Login> {
  LoginModel(Login data) : super(data);
}

class Login extends ParseJson {
  Mch mch;
  String accessToken;
  Account account;

  Login fromJson(Map<String, dynamic> json) {
    mch = json['mch'] != null ? new Mch.fromJson(json['mch']) : null;
    accessToken = json['accessToken'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mch != null) {
      data['mch'] = this.mch.toJson();
    }
    data['accessToken'] = this.accessToken;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    return data;
  }

  @override
  Login jsonParse(Map<String, dynamic> data) {
    return fromJson(data);
  }
}
