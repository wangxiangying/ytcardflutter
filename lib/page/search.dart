import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSpace {
  TimeSpace(this.startTime, this.endTime);

  String startTime;
  String endTime;
}

class SearchPage extends StatefulWidget {
  @override
  BillListPageState createState() => BillListPageState();
}

class BillListPageState extends State<SearchPage> {
  String currentTime;
  String startTime = "2010-11-12 00:00:00";
  String endTime = "2020-11-22 00:00:00";
  static const DAY1 = 1;
  static const DAY3 = 3;
  static const DAY7 = 7;
  var _day = 0;
  var formatter = new DateFormat('yyyy-MM-dd hh:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0.5,
            brightness: Brightness.light,
            centerTitle: true,
            title: Text(
              '筛选',
              style: TextStyle(color: Color(0xff000000)),
            ),
            backgroundColor: Color(0xffffffff),
            iconTheme: IconThemeData(color: Color(0xffffffff)),
            leading: IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            )),
        body: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: new Column(
            children: <Widget>[
              Container(
                height: 15,
                color: Color.fromARGB(100, 233, 233, 233),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "选择交易时间",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ChoiceChip(
                          label: Text("今天"),
                          selected: _day == DAY1,
                          onSelected: (selected) {
                            _calc(DAY1);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ChoiceChip(
                            label: Text("近三天"),
                            selected: _day == DAY3,
                            onSelected: (selected) {
                              _calc(DAY3);
                            }),
                      ),
                      Expanded(
                        flex: 1,
                        child: ChoiceChip(
                          label: Text("近七天"),
                          selected: _day == DAY7,
                          onSelected: (selected) {
                            _calc(DAY7);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("请选择开始日期"),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: TextField(
                                  controller:
                                      TextEditingController(text: startTime),
                                  textAlign: TextAlign.end,
                                  cursorColor: Colors.black,
                                  enabled: false,
                                  decoration: new InputDecoration(
                                      fillColor: Colors.blue.shade100,
                                      filled: true,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintText: "请选择开始日期"),
                                ),
                              )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("请选择结束日期"),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(22.0),
                                child: TextField(
                                  controller:
                                      TextEditingController(text: endTime),
                                  onTap: () => {},
                                  textAlign: TextAlign.end,
                                  cursorColor: Colors.black,
                                  enabled: false,
                                  decoration: new InputDecoration(
                                      fillColor: Colors.blue.shade100,
                                      filled: true,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintText: "请选择结束日期"),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color.fromARGB(100, 233, 233, 233),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(height: 55.0),
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop(TimeSpace(startTime, endTime));
                          },
                          textColor: Colors.white,
                          child: Text("确定"),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  _calc(int day) {
    startTime = updateTime(day - 1);
    endTime = updateTime(-1);
    setState(() {
      _day = day;
    });
  }

  String updateTime(int day) {
    DateTime now = DateTime.now().toLocal();
    DateTime start = now.subtract(Duration(days: day));
    DateTime startTrue = DateTime(start.year, start.month, start.day, 0, 0, 0);
    return "${DateFormat('yyyy-MM-dd HH:mm:ss').format(startTrue)}";
  }
}
