import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ytcardapp/utils/adapt.dart';
import 'package:ytcardapp/view/CircleProgressBar.dart';
import 'package:ytcardapp/view/MyIconButton.dart';

import '../theme.dart';
import 'index.dart';

class HomeRoutePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeRoutePageState();
  }
}

class HomeRoutePageState extends State<HomeRoutePage>
    with SingleTickerProviderStateMixin {

  final random = new Random();
  var progress = 0.0;
  AnimationController animationController;
  CircleProgressBarTween progressBarTween;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    progressBarTween = new CircleProgressBarTween(
        new CircleProgressBar(0.0, max: 360.0), new CircleProgressBar(0.0, max: 360.0));
    animationController.forward();
  }

  void _incrementCounter() {
    setState(() {
      progress = random.nextDouble() * 360.0;
      animationController = new AnimationController(
          vsync: this, duration: const Duration(milliseconds: 300));
      progressBarTween = new CircleProgressBarTween(
          progressBarTween.evaluate(animationController),
          new CircleProgressBar(progress, max: 360.0));
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.topCenter, //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          new HomeIndexPage(),
          Positioned(
            top: 140,
            child: Column(
              children: <Widget>[
                Container(
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x66888888),
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                            spreadRadius: 1.0),
                        BoxShadow(color: Color(0xffffffff))
                      ],
                    ),
                    height: 140,
                    width: 340,
                    alignment: Alignment.center,
                    child: Container(
                        child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Center(
                              child: MyIconWidget(
                            icons: Image.asset("assets/saoma.png"),
                            text: "扫一扫收款",
                          )),
                        ),
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: MyIconWidget(
                              icons: Image.asset("assets/erweima.png"),
                              text: "二维码收款",
                            ))),
                      ],
                    ))),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x66888888),
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                            spreadRadius: 1.0),
                        BoxShadow(color: Color(0xffffffff))
                      ],
                    ),
                    height: 340,
                    width: 340,
                    alignment: Alignment.center,
                    child: Container(
                        child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(flex: 1, child: Text("今日实收总金额")),
                              Image.asset("assets/jiantou.png",width: 7,height: 10),
                            ],
                          ),
                          Expanded(
                              flex: 1,
                              child: new CustomPaint(
                                size: const Size(60.0, 60.0),
                                painter: new CircleProgressBarPainter(
                                    progressBarTween.animate(animationController)),
                              ),),
                         ],
                      ),
                    ))),
              ],
            ),
          ),
        ],
      ),
    );

    return new Scaffold(
        body: new Column(children: <Widget>[
      new Container(
          height: Adapt.padTopH() + Adapt.px(90),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Style.mainColor, Style.mainLightColor])),
          child: new HomeIndexPage()),
//      new Expanded(
//          child: new TabBarView(
//        children: categoryPageList,
//        controller: mController,
//      )),
//          new HomeIndexPage()
    ], mainAxisSize: MainAxisSize.min));
  }
}
