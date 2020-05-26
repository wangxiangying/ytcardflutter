import 'package:json_annotation/json_annotation.dart';



@JsonSerializable()
class Product extends Object {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'afterCouponPrice')
  double afterCouponPrice;

  @JsonKey(name: 'sellCount')
  int sellCount;

  @JsonKey(name: 'couponPrice')
  double couponPrice;

  @JsonKey(name: 'couponInfo')
  String couponInfo;

  @JsonKey(name: 'shopName')
  String shopName;

  @JsonKey(name: 'rebateAmount')
  double rebateAmount;

  @JsonKey(name: 'imageUrl')
  String imageUrl;

  @JsonKey(name: 'longTitle')
  String longTitle;

  Product(
    this.title,
    this.price,
    this.afterCouponPrice,
    this.sellCount,
    this.couponPrice,
    this.couponInfo,
    this.shopName,
    this.rebateAmount,
    this.imageUrl,
    this.longTitle,
  );


}