import 'dart:ui';

import 'package:flutter/material.dart';

class QrCodePage extends StatefulWidget {
  @override
  QrCodePageState createState() => QrCodePageState();
}

class QrCodePageState extends State<QrCodePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0.5,
            brightness: Brightness.light,
            centerTitle: true,
            title: Text(
              '店铺二维码',
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
          child: Container(),
        ));
  }
}
