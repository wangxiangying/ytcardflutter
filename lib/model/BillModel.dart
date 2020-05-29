import 'Carousel.dart';

class BillModel extends NetData<Bill> {
  BillModel(Bill data) : super(data);
  Bill get bill => data;
}

class Bill extends ParseJson {
  double amount  ;
  int refundCount  ;
  int orderCount  ;

  Bill fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    refundCount = json['refundCount'];
    orderCount = json['orderCount'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['refundCount'] = this.refundCount;
    data['orderCount'] = this.orderCount;

    return data;
  }

  @override
  Bill jsonParse(Map<String, dynamic> data) {
    return fromJson(data);
  }
}
