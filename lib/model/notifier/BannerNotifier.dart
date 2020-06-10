import 'package:flutter/cupertino.dart';
import '../MyBanner.dart';

class BannerNotifier extends ChangeNotifier {
  List<MyBanner> _bannerModel = [];

  BannerNotifier();

  get bannerModel => _bannerModel;

  BannerNotifier setBannerModel(List<MyBanner> item) {
    _bannerModel = item;
    notifyListeners();
    return this;
  }
}
