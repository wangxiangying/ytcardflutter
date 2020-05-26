import 'package:flutter/cupertino.dart';
import 'package:ytcardapp/service/service.dart';

import '../MyBanner.dart';

class BannerNotifier extends ChangeNotifier {
  List<MyBanner> _bannerModel = [];

   BannerNotifier();

  get bannerModel => _bannerModel;

  BannerNotifier SetBannerModel(List<MyBanner> item) {
    _bannerModel = item;
    notifyListeners();
    return this;
  }

  fetchSomething() async {
      await IndexService.getCarousel();
  }
}
