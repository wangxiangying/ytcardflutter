import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class MyIconWidget extends StatefulWidget {
  final Widget icons;
  final String text;
  final Function fun;

  MyIconWidget( {this.icons, this.text,this.fun, Key key}) : super(key: key);

  @override
  _MyIconWidgetState createState() => _MyIconWidgetState(this);
}

class _MyIconWidgetState extends State<MyIconWidget> {
  MyIconWidget weights;

  _MyIconWidgetState(this.weights);

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: weights.icons,
          iconSize: 46,
          onPressed: weights.fun,
        ),
        Text(weights.text,
        style: TextStyle(color: Style.appColor)
        )
      ],
    );
  }
}
