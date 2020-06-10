import 'package:flutter/cupertino.dart';

import '../TradeModel.dart';

class TradeNotifier extends ChangeNotifier {
  TradeModel _tradeModel;

  get tradeModel => _tradeModel;

  set tradeModel(TradeModel item) {
    _tradeModel = item;
    notifyListeners();
  }
}
