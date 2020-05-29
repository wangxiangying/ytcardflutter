import 'package:flutter/cupertino.dart';

class NetNotify extends ChangeNotifier {
  int _code;
  String _message;

  get code => _code;

  get message => _message;

  setNetData(int item, String message) {
    _code = item;
    _message = message;

    notifyListeners();
  }
}
