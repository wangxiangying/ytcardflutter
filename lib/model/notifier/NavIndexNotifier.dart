import 'package:flutter/cupertino.dart';

class NavIndexNotifier extends ChangeNotifier {
  int _index = 0;

  get index => _index;

  setIndex(int item) {
    _index = item;
    notifyListeners();
  }
}
