import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytcardapp/model/Bill.dart';
import 'package:ytcardapp/model/notifier/BillListNotifier.dart';
import 'package:ytcardapp/model/notifier/BillNotifier.dart';
import 'package:ytcardapp/service/service.dart';
import 'package:ytcardapp/view/title.dart';

import '../theme.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ActivityPageState();
  }
}

class ActivityPageState extends State<ActivityPage> {
  final items = new List<String>.generate(1000, (i) => "Item $i");
  String startTime = "2010-11-12 00:00:00";
  String endTime = "2020-11-22 00:00:00";
  int pageNo = 1;
  int pageSize = 10;
  BillListNotifier billListNotifier;
  var list = List<TransactionList>();

  @override
  void initState() {
    super.initState();
    search();
  }

  void search() async {
    billListNotifier =
        await IndexService.getBillList(startTime, endTime, pageNo, pageSize);
    list = (billListNotifier.data as BillListModel).data.transactionList;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TitleCommand(
          title: '交易记录',
          rightButton: "筛选",
        ),
        Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Style.mainColor, Style.mainLightColor])),
          //padding: EdgeInsets.only(top: Adapt.padTopH() / 2),
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
              Text("今日")
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
                              "${billNotifier?.data?.bill?.orderCount}");
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
                          return Text(
                              "${billNotifier?.data?.bill?.refundCount}");
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
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return new ListTile(
                title: new Text('${list[index].cardNo}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
