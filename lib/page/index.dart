import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:ytcardapp/model/notifier/BannerNotifier.dart';
import 'package:ytcardapp/model/product.dart';
import 'package:ytcardapp/service/service.dart';
import 'package:ytcardapp/utils/adapt.dart';

import '../theme.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeIndexPageState();
  }
}

class HomeIndexPageState extends State<HomeIndexPage> {
  void initData() async {

  }

//
//  void onProductClick(Product product) {
//    Navigator.push(context,
//        new MaterialPageRoute(builder: (BuildContext context) {
//      return new ProductDetail(product);
//    }));
//  }

//  Future<Null> _refresh() async {
//    var model = await IndexService.getCarousel();
//    print("length ::" + model.length.toString());
//    return;
//  }

  void initState() {
    initData();
  }

  Widget buildSwiper() {
    return Container(
        height: Adapt.padTopH() + Adapt.px(90),
        child: new Swiper(
          itemBuilder: (BuildContext buildContext, int index) {
            if (Provider.of<BannerNotifier>(context).bannerModel.length < 0) {
              return new Text("-");
            } else {
              return new Image.network(
                  Provider.of<BannerNotifier>(context)
                      .bannerModel[index]
                      .banner,
                  fit: BoxFit.fill);
            }
          },
          itemCount: Provider.of<BannerNotifier>(context).bannerModel.length,
          //pagination: new SwiperPagination(),
          autoplay: true,
          //control: new SwiperControl()
          //pagination: null
        ));
  }

  Widget buildRecommond() {
    return new Container(
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: Adapt.px(5))),
          new Expanded(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
                new Container(
                  child: new Center(
                      child: new Text('特惠怒装',
                          style:
                              TextStyle(color: Style.mainColor, fontSize: 18))),
                ),
                new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
                new Container(
                    child: new Center(
                  child: new Text('0至12岁应有尽有',
                      style: TextStyle(color: Style.mainTextColor)),
                )),
                new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
                new Container(
                    child: new Image.network(
                        'http://app.zhetaoke.com:10000/style/images/huodong/20.jpg'))
              ],
            ),
          ),
          new Expanded(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
                new Container(
                  child: new Center(
                      child: new Text('特惠怒装',
                          style:
                              TextStyle(color: Style.mainColor, fontSize: 18))),
                ),
                new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
                new Container(
                    child: new Center(
                  child: new Text('0至12岁应有尽有',
                      style: TextStyle(color: Style.mainTextColor)),
                )),
                new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
                new Container(
                    child: new Image.network(
                        'http://app.zhetaoke.com:10000/style/images/huodong/20.jpg'))
              ],
            ),
          ),
          new Expanded(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
                new Container(
                  child: new Center(
                      child: new Text('特惠怒装',
                          style:
                              TextStyle(color: Style.mainColor, fontSize: 18))),
                ),
                new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
                new Container(
                    child: new Center(
                  child: new Text('0至12岁应有尽有',
                      style: TextStyle(color: Style.mainTextColor)),
                )),
                new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
                new Container(
                    child: new Image.network(
                        'http://app.zhetaoke.com:10000/style/images/huodong/20.jpg'))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBanner() {
    return new Column(children: <Widget>[
      Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
      new Image.network(
          'http://app.zhetaoke.com:10000/style/images/huodong/100.png'),
      Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
    ]);
  }

  Widget buildProduct(Product product) {
    var self = this;
    return new Expanded(
        child: new InkWell(
//      onTap: () => self.onProductClick(product),
      child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            new Image.network(product.imageUrl),
            new Container(
              color: Color(0xEE666666),
              child: new Center(
                  child: new Text(product.shopName,
                      style: TextStyle(color: Colors.white))),
            )
          ],
        ),
        new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
        new Center(
          child: new Text(product.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Style.mainTextColor)),
        ),
        new Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
        new Container(
          padding: EdgeInsets.only(left: Adapt.px(5), right: Adapt.px(5)),
          child: new Row(children: <Widget>[
            new Text('淘宝价￥' + product.price.toString(),
                style: TextStyle(fontSize: 12, color: Style.mainTextColor)),
            new Padding(padding: EdgeInsets.only(top: 10)),
            new Text(
                '已售${product.sellCount > 10000 ? (product.sellCount / 10000).round() : product.sellCount}${product.sellCount > 10000 ? '万+' : ''}',
                style: TextStyle(fontSize: 12, color: Style.mainTextColor))
          ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
        ),
        new Container(
          padding: EdgeInsets.only(left: Adapt.px(5), right: Adapt.px(5)),
          child: new Row(
            children: <Widget>[
              new Text('券后价￥' + product.afterCouponPrice.toString(),
                  style: TextStyle(color: Style.mainColor, fontSize: 12)),
              new Text('券 ￥' + product.couponPrice.toString(),
                  style: TextStyle(color: Style.mainColor, fontSize: 12)),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        )
      ]),
    ));
  }

  Widget buildProductRow(List<Product> products) {
//    print(products[0].toJson().toString());
    return new Container(
        margin: EdgeInsets.only(top: Adapt.px(10)),
        child: new Row(children: <Widget>[
          new Padding(padding: EdgeInsets.only(left: Adapt.px(5))),
          buildProduct(products[0]),
          new Padding(padding: EdgeInsets.only(left: Adapt.px(5))),
          buildProduct(products[1]),
          new Padding(padding: EdgeInsets.only(right: Adapt.px(5)))
        ]));
  }

  @override
  Widget build(BuildContext context) {


     return buildSwiper();


    return ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: 4,
        itemBuilder: (BuildContext buildContext, int index) {
          if (index == 0) {
            return buildSwiper();
          } else if (index == 1) {
            return buildRecommond();
          } else if (index == 2) {
            return buildBanner();
          } else {
            return buildBanner();

//
//            return Provide<Store>(builder: (context, child, store) {
//              print(store.indexProducts);
//              List<Product> products = store.indexProducts;
//              if (products == null || products.length == 0) {
//                return Container();
//              } else {
//                List<List<Product>> p = new List();
//                for (var i = 0; i < products.length / 2; i++) {
//                  p.add(products.sublist(i * 2, i * 2 + 2));
//                }
//                List<Widget> w = new List();
//                for (var k in p) {
//                  w.add(buildProductRow(k));
//                }
//                return new Column(children: w);
//              }
//            });
          }
        });
  }
}
