abstract class NetData<T extends ParseJson>   {
  int code;
  String message;
  T data;

  NetData(this.data);

  fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      parse(json['data']);
    }
  }

  T parse(Map<String, dynamic> json) {
    return data.jsonParse(json);
  }
}

abstract class ParseJson {
  ParseJson jsonParse(Map<String, dynamic> data)  ;
}

abstract class ListNetData<T extends ParseJson>  {
  int code;
  String message;
  List<T> data;
  ListNetData(this.data);
  fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      Iterable<dynamic> items = json['data'];
      items.forEach((e) {
        T it=( e as T).jsonParse(e);
        print(it.toString());
        data.add(it);
      });
     }
  }
}


