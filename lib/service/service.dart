import 'package:ytcardapp/model/Bill.dart';
import 'package:ytcardapp/model/BillModel.dart';
import 'package:ytcardapp/model/LoginModel.dart';
import 'package:ytcardapp/model/MyBanner.dart';
import 'package:ytcardapp/model/TradeModel.dart';
import 'package:ytcardapp/model/notifier/BannerNotifier.dart';
import 'package:ytcardapp/model/notifier/BillListNotifier.dart';
import 'package:ytcardapp/model/notifier/BillNotifier.dart';
import 'package:ytcardapp/model/notifier/LoginNotifier.dart';
import 'package:ytcardapp/model/notifier/TradeNotifier.dart';
import 'package:ytcardapp/utils/net-utils.dart';

class NetService {
//  static Future<List<Product>> getIndexProducts(int page) async {
//    Map<String, dynamic> response =
//    await NetUtil.get('/api/index/products', {"page": page.toString()});
//    //print(response.toString());
//    Iterable data = response['data'];
//    //var list = jsonDecode(data);
//    List<Product> products = data != null
//        ? data.map((item) => Product.fromJson(item)).toList()
//        : null;
//    return Future.value(products);
//  }

  static Future<LoginModel> login(String mchid, String password) async {
    Map<String, String> params = new Map();
    params["mchid"] = mchid;
    params["password"] = password;
    Map<String, dynamic> response = await NetUtil.post('login', params);
    LoginModel model = LoginModel((Login()));
    model.fromJson(response);
    LoginNotifier().loginModel = model;
    return Future.value(model);
  }

  static Future<BillNotifier> bill() async {
    Map<String, String> params = new Map();
    Map<String, dynamic> response = await NetUtil.get('bill', params);
    BillModel model = BillModel(Bill());
    model.fromJson(response);
    var notify = BillNotifier().setData(model) as BillNotifier;
    return Future.value(notify);
  }

  static Future<BannerNotifier> getCarousel() async {
    Map<String, dynamic> response = await NetUtil.get('index/carousel', null);
    Iterable data = response["data"];
    List<MyBanner> myBanners = data != null
        ? data.map((item) => MyBanner().fromJson(item)).toList()
        : null;

    var notify = BannerNotifier().setBannerModel(myBanners);
    return Future.value(notify);
  }

  static Future<BillListNotifier> getBillList(
      String startTime, String endTime, int pageNo, int pageSize) async {
    Map<String, String> params = new Map();
    if (startTime != null) {
      params["startTime"] = startTime;
    }
    if (endTime != null) {
      params["endTime"] = endTime;
    }
    if (pageNo != null) {
      params["pageNo"] = pageNo.toString();
    }
    if (pageSize != null) {
      params["pageSize"] = pageSize.toString();
    }
    Map<String, dynamic> response =
        await NetUtil.get('pay/transaction/query', params);
    BillListModel model = BillListModel(BillResult());
    model.fromJson(response);
    var notify = BillListNotifier().setData(model) as BillListNotifier;
    return Future.value(notify);
  }



  static Future<TradeModel> pay(String amount, String orderId) async {
    Map<String, String> params = new Map();
    params["amount"] = amount;
    params["orderId"] = orderId;
    Map<String, dynamic> response = await NetUtil.post('pay', params);
    TradeModel model = TradeModel((Trade()));
    model.fromJson(response);
    TradeNotifier().tradeModel = model;
    return Future.value(model);
  }
}
