import 'Carousel.dart';

class TradeModel extends NetData<Trade> {
  TradeModel(Trade data) : super(data);
}

class Trade extends ParseJson {
  bool negative;
  double absoluteAmount;
  String cardNo;
  String refundTime;
  String createTime;
  String remark;
  double tranAmt;
  String tranNo;
  String tranType;
  String refundReason;
  PayUser payUser;
  int isRefund; // 0 未退   1已退

  Trade fromJson(Map<String, dynamic> json) {
    negative = json['negative'];
    absoluteAmount = json['absoluteAmount'];
    cardNo = json['cardNo'];
    refundTime = json['refundTime'];
    createTime = json['createTime'];
    remark = json['remark'];
    tranAmt = json['tranAmt'];
    tranNo = json['tranNo'];

    tranType = json['tranType'];
    refundReason = json['refundReason'];
    isRefund = json['isRefund'];

    payUser =
        json['payUser'] != null ? new PayUser.fromJson(json['payUser']) : null;
    return this;
  }

  @override
  Trade jsonParse(Map<String, dynamic> data) {
    return fromJson(data);
  }
}

class PayUser {
  String phone;
  PayUser.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }
}
