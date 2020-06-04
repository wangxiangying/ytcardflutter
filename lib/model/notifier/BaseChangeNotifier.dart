import 'package:flutter/cupertino.dart';
import 'package:ytcardapp/model/Carousel.dart';
import 'package:ytcardapp/view/Dialog.dart';

class BaseChangeNotifier<T extends NetData> extends ChangeNotifier
    with MyDialog {
  T _data;

  get data => _data;

  BaseChangeNotifier setData(T item) {
    _data = item;
    if (_data.code == 401) {
      alert("登陆失效，请重新登录", {});
    }
    notifyListeners();
    return this;
  }
}
