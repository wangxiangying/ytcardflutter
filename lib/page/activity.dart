import 'package:flutter/material.dart';
import 'package:ytcardapp/view/title.dart';


class ActivityPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new ActivityPageState();
  }

}

class ActivityPageState extends State<ActivityPage> {

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TitleCommand(title: '活动中心')
      ],
    );
  }

}