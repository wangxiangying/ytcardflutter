import 'package:ytcardapp/model/notifier/NetNotifier.dart';

abstract class NetData<T extends ParseJson> {
  int code;
  String message;
  T data;

  get result => data;

  NetData(this.data);

  fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      parse(json['data']);
    }
    NetNotify().setNetData(code, message);
  }

  T parse(Map<String, dynamic> json) {
    return data.jsonParse(json);
  }
}

abstract class ParseJson {
  ParseJson jsonParse(Map<String, dynamic> data);
}
