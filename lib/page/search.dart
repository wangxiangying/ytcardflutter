import 'package:flutter/material.dart';
import 'package:ytcardapp/view/title.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BillListPageState();
  }
}

class BillListPageState extends State<SearchPage> {
  String startTime = "2010-11-12 00:00:00";
  String endTime = "2020-11-22 00:00:00";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        children: <Widget>[
          new TitleCommand(
            title: '筛选',
          ),
          Expanded(
            flex: 1,
            child: Container(
             ),
          )
        ],
      ),
    );
  }
}
