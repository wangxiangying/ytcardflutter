import 'Carousel.dart';

class BillListModel extends NetData<BillResult> {
  BillListModel(BillResult data) : super(data);
}

class BillResult extends ParseJson {
  Count count;
  Page page;
  List<TransactionList> transactionList;

  BillResult({this.count, this.page, this.transactionList});

  @override
  ParseJson jsonParse(Map<String, dynamic> data) {
    return fromJson(data);
  }

  BillResult fromJson(Map<String, dynamic> json) {
    count = json['count'] != null ? new Count.fromJson(json['count']) : null;
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    if (json['transactionList'] != null) {
      transactionList = new List<TransactionList>();
      json['transactionList'].forEach((v) {
        transactionList.add(new TransactionList.fromJson(v));
      });
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.count != null) {
      data['count'] = this.count.toJson();
    }
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    if (this.transactionList != null) {
      data['transactionList'] =
          this.transactionList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Count {
  double amount;
  int count;

  Count({this.amount, this.count});

  Count.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['count'] = this.count;
    return data;
  }
}

class Page {
  int pageCount;
  int pageNo;
  int pageSize;
  int totalCount;

  Page({this.pageCount, this.pageNo, this.pageSize, this.totalCount});

  Page.fromJson(Map<String, dynamic> json) {
    pageCount = json['pageCount'];
    pageNo = json['pageNo'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageCount'] = this.pageCount;
    data['pageNo'] = this.pageNo;
    data['pageSize'] = this.pageSize;
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class TransactionList {
  double absoluteAmount;
  String cardNo;
  int createTime;
  int isRefund;
  bool negative;
  PayUser payUser;
  Null refundReason;
  Null refundTime;
  String remark;
  double tranAmt;
  String tranNo;
  int tranType;

  TransactionList(
      {this.absoluteAmount,
      this.cardNo,
      this.createTime,
      this.isRefund,
      this.negative,
      this.payUser,
      this.refundReason,
      this.refundTime,
      this.remark,
      this.tranAmt,
      this.tranNo,
      this.tranType});

  TransactionList.fromJson(Map<String, dynamic> json) {
    absoluteAmount = json['absoluteAmount'];
    cardNo = json['cardNo'];
    createTime = json['createTime'];
    isRefund = json['isRefund'];
    negative = json['negative'];
    payUser =
        json['payUser'] != null ? new PayUser.fromJson(json['payUser']) : null;
    refundReason = json['refundReason'];
    refundTime = json['refundTime'];
    remark = json['remark'];
    tranAmt = json['tranAmt'];
    tranNo = json['tranNo'];
    tranType = json['tranType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['absoluteAmount'] = this.absoluteAmount;
    data['cardNo'] = this.cardNo;
    data['createTime'] = this.createTime;
    data['isRefund'] = this.isRefund;
    data['negative'] = this.negative;
    if (this.payUser != null) {
      data['payUser'] = this.payUser.toJson();
    }
    data['refundReason'] = this.refundReason;
    data['refundTime'] = this.refundTime;
    data['remark'] = this.remark;
    data['tranAmt'] = this.tranAmt;
    data['tranNo'] = this.tranNo;
    data['tranType'] = this.tranType;
    return data;
  }
}

class PayUser {
  String phone;

  PayUser({this.phone});

  PayUser.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    return data;
  }
}
