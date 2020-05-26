//import 'package:flutter/material.dart';
//
//import 'model/product.dart';
//
//
//
//class ProductDetail extends StatelessWidget {
//
//  Product _product;
//
//  ProductDetail(Product product) {
//    this._product = product;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    print(this._product.toJson());
//    return new Scaffold(
//      appBar: new AppBar(
//        iconTheme: IconThemeData(
//            color: Colors.black87, //change your color here
//          ),
//        title:  new Text('商品详情', style: new TextStyle(color: Colors.black87)),
//        backgroundColor: Colors.white,
//      ),
//      body: new ListView(
//        children: <Widget>[
//           new Container(
//             height: Adapt.px(250),
//             child: new Image.network(_product.imageUrl, fit: BoxFit.cover, alignment: Alignment.center,),
//           ),
//           Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
//           new Row(
//             children: <Widget>[
//               new Expanded(
//                 child: new Container(
//                   padding: EdgeInsets.all(Adapt.px(5)),
//                   child: new Text(_product.longTitle, style: new TextStyle(fontSize: 14)),
//                 )
//               ),
//               new Container(
//                 width: Adapt.px(50),
//               )
//             ],
//           ),
//           Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: <Widget>[
//               new Container(
//                 margin: EdgeInsets.only(left: Adapt.px(10)),
//                 padding: EdgeInsets.all(Adapt.px(2)),
//                 child: new Text('券后价', style: TextStyle(fontSize: 11, color: Style.mainColor)),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Style.mainColor),
//                   borderRadius: BorderRadius.all(Radius.circular(Adapt.px(3)))
//                 ),
//               ),
//               new Padding(padding: EdgeInsets.only(left: Adapt.px(10))),
//               new Text('￥', style: TextStyle(fontSize: 11, color: Style.mainColor)),
//               new Text(_product.afterCouponPrice.toString(), style: TextStyle(fontSize: 18, color: Style.mainColor, fontWeight: FontWeight.bold))
//             ],
//           ),
//           Padding(padding: EdgeInsets.only(top: Adapt.px(5))),
//           Row(
//             children: <Widget>[
//               Padding(padding: EdgeInsets.only(left: Adapt.px(10))),
//               Text('现价', style: TextStyle(fontSize: 12, color: Style.mainTextColor)),
//               Padding(padding: EdgeInsets.only(left: Adapt.px(10))),
//               Text('￥', style: TextStyle(fontSize: 12, color: Style.mainTextColor)),
//               Text(_product.price.toString(), style: TextStyle(fontSize: 12, color: Style.mainTextColor, decoration: TextDecoration.lineThrough))
//             ],
//           )
//        ],
//      ),
//    );
//  }
//}