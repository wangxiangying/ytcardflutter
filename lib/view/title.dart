import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme.dart';
import '../utils/adapt.dart';

// ignore: must_be_immutable
class TitleCommand extends StatelessWidget {
  String title;
  String rightButton;
  Function rightFunction;
  Function backFunction;

  TitleCommand(
      {this.title,
      this.rightButton,
      this.rightFunction,
      this.backFunction,
      Key key})
      : super(key: key);

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
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: new Text(title,
                    style: TextStyle(fontSize: 18, color: Color(0xff000000))),
              ),
              GestureDetector(
                onTap: rightFunction,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 12, 0),
                    child: new Text(rightButton ?? "",
                        style: TextStyle(fontSize: 15, color: Style.appColor)),
                  ),
                ),
              ),
            ],
          )
        ], mainAxisAlignment: MainAxisAlignment.center));
  }
}
