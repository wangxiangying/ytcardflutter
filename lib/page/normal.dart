import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeNormalPage extends StatefulWidget {
  String title;
  HomeNormalPage(this.title, {Key key}): super(key: key) { }
  @override
  State<StatefulWidget> createState() {
    return new HomeNormalPageState();
  }
}
class HomeNormalPageState extends State<HomeNormalPage> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title);
  }
}