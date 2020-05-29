import 'package:ytcardapp/model/BillModel.dart';
import 'package:ytcardapp/model/LoginModel.dart';
import 'package:ytcardapp/model/MyBanner.dart';
import 'package:ytcardapp/model/notifier/BannerNotifier.dart';
import 'package:ytcardapp/model/notifier/BillNotifier.dart';
import 'package:ytcardapp/model/notifier/LoginNotifier.dart';
import 'package:ytcardapp/utils/net-utils.dart';

class IndexService {
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

    var notify = BannerNotifier().SetBannerModel(myBanners);
    return Future.value(notify);
  }
}
