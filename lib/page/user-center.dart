import 'package:flutter/material.dart';
import 'package:ytcardapp/view/title.dart';


class UserCenterPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new UserCenterPageState();
  }

}

class UserCenterPageState extends State<UserCenterPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          new TitleCommand(title: '个人中心')
        ],
      ),
    );
  }

}