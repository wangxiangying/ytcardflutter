import 'package:flutter/material.dart';

import '../theme.dart';
import '../utils/adapt.dart';

// ignore: must_be_immutable
class TitleCommand extends StatelessWidget {
  String title;
  TitleCommand({this.title, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Container(
        //padding: EdgeInsets.only(top: Adapt.padTopH() + Adapt.px(10)),
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [Style.mainColor, Style.mainLightColor])),
        //padding: EdgeInsets.only(top: Adapt.padTopH() / 2),
        height: Adapt.padTopH() + Adapt.px(50),
        child: new Column(children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: Adapt.padTopH())),
          new Center(
              child: new Text(title,
                  style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF))))
        ], mainAxisAlignment: MainAxisAlignment.center));
  }
}
