import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ytcardapp/model/Bill.dart';
import 'package:ytcardapp/model/notifier/BillListNotifier.dart';
import 'package:ytcardapp/model/notifier/BillNotifier.dart';
import 'package:ytcardapp/page/search.dart';
import 'package:ytcardapp/service/service.dart';
import 'package:ytcardapp/view/title.dart';

import '../theme.dart';

class BillListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BillListPageState();
  }
}

class BillListPageState extends State<BillListPage> {
  String startTime = "2010-11-12 00:00:00";
  String endTime = "2020-11-22 00:00:00";
  var formatter = new DateFormat('yyyy-MM-dd hh:mm:ss');

  int pageNo = 1;
  int pageSize = 10;
  BillListNotifier billListNotifier;
  BillListModel billListModel;
  ScrollController _scrollController = new ScrollController();
  bool isHadMore = true;
  bool isPerformingRequest = false;
  var list = List<TransactionList>();
  Count count;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (isHadMore) {
          _loadMore();
        }
      }
    });
    _search();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<Null> _refresh() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      pageNo = 1;
      list.clear();
      await _search();
    }
  }

  Future<Null> _loadMore() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      pageNo++;
      await _search();
    }
  }

  Future<List<TransactionList>> _search() async {
    billListNotifier =
        await IndexService.getBillList(startTime, endTime, pageNo, pageSize);
    billListModel = billListNotifier.data as BillListModel;
    var tempList = billListModel.data.transactionList;
    count = billListModel.data.count;
    if (tempList.length < pageSize) {
      isHadMore = false;
    } else {
      isHadMore = true;
    }
    if (tempList.length > 0) {
      list.addAll(tempList);
    }
    setState(() => isPerformingRequest = false);
    return list;
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => new SearchPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TitleCommand(
          title: '交易记录',
          rightButton: "筛选",
          rightFunction: () => {_navigateAndDisplaySelection(context)},
        ),
        Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Style.mainColor, Style.mainLightColor])),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(
                  width: 2.0,
                  height: 18.0,
                  child: new RaisedButton(
                    onPressed: () {},
                    color: Colors.grey,
                    shape: new BeveledRectangleBorder(
                        side: new BorderSide(
                      style: BorderStyle.none,
                    )),
                  ),
                ),
              ),
              Text("$startTime -  $endTime ")
            ],
          ),
        ),
        Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Style.mainColor, Style.mainLightColor])),
          //padding: EdgeInsets.only(top: Adapt.padTopH() / 2),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 1.0,
              indent: 0.0,
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          height: 70,
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Style.mainColor, Style.mainLightColor])),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "交易金额 (元)",
                          style: TextStyle(color: Color(0x66666666)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Consumer<BillNotifier>(
                        builder: (context, billNotifier, child) {
                          return Text(
                              count == null ? "--" : "${count?.amount}");
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "交易笔数 (笔)",
                          style: TextStyle(color: Color(0x66666666)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Consumer<BillNotifier>(
                        builder: (context, billNotifier, child) {
                          return Text(count == null ? "--" : "${count?.count}");
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: list == null ? 1 : list.length + 1,
              itemBuilder: (context, index) {
                if (list == null || (list.length == 0 && isPerformingRequest)) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                    child: Text("正在获取。。。"),
                  ));
                }
                if (list.length == 0) {
                  return Center(child: Text("暂无数据"));
                }
                if (index == list.length) {
                  if (isHadMore) {
                    return _buildProgressIndicator();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 30),
                      child: Center(child: Text("没有更多了")),
                    );
                  }
                } else if (index < list.length) {
                  var item = list[index];
                  var isRefund = item.tranType == 2;
                  return Row(
                    children: <Widget>[
                      SizedBox(
                        width: 72.0,
                        height: 72.0,
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: CustomPaint(
                                  size: Size(40, 40), //指定画布大小
                                  painter: MyPainter(
                                      isRefund ? Style.red : Style.blue),
                                ),
                              ),
                              Center(
                                child: Text(
                                  isRefund ? "退" : "收",
                                  style: TextStyle(
                                      color: Color(0xffffffff), fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${item.cardNo}",
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                            Text(
                                "${formatter.format(DateTime.fromMillisecondsSinceEpoch(item.createTime, isUtc: false))}",
                                style: TextStyle(
                                  color: Color(0xaa999999),
                                  fontSize: 13,
                                ))
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "${item.tranAmt} ",
                            style: TextStyle(
                                color: isRefund ? Style.red : Style.blue,
                                fontSize: 16),
                          ),
                          Text("  >  "),
                        ],
                      )
                    ],
                  );
                } else {
                  return Text("");
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 2;
    double eHeight = size.height / 2;

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = backColor;
    canvas.drawCircle(Offset(eWidth, eHeight), 24.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
  var backColor;

  MyPainter(this.backColor);
}
