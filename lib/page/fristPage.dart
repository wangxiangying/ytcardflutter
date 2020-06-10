import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytcardapp/model/notifier/BillNotifier.dart';
import 'package:ytcardapp/model/notifier/NavIndexNotifier.dart';
import 'package:ytcardapp/page/qrcode.dart';
import 'package:ytcardapp/page/money_for_scan.dart';
import 'package:ytcardapp/service/service.dart';
import 'package:ytcardapp/view/CircleProgressBar.dart';
import 'package:ytcardapp/view/MyIconButton.dart';

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
  int count = 0;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    progressBarTween = new CircleProgressBarTween(
        new CircleProgressBar(0.0, max: 360.0),
        new CircleProgressBar(0.0, max: 360.0));
    animationController.forward();
  }

  Future<void> _refresh() async {
    await NetService.bill();
    setState(() {
      count++;
      progressBarTween = new CircleProgressBarTween(
          new CircleProgressBar(20.0, max: count.toDouble()),
          new CircleProgressBar(count.toDouble(), max: 360.0));
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final billNotifier = Provider.of<BillNotifier>(context);
    return Stack(
      children: <Widget>[
        new HomeIndexPage(),
        RefreshIndicator(
          onRefresh: _refresh,
          color: Theme.of(context).primaryColor, //指示器颜色
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
                child: Container(
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
                    height: 120,
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
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => new MoneyForScanPage()));
                            },
                            text: "扫一扫收款",
                          )),
                        ),
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: MyIconWidget(
                              icons: Image.asset("assets/erweima.png"),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => new QrCodePage()));
                              },
                              text: "二维码收款",
                            ))),
                      ],
                    ))),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                  height: 320,
                  width: 340,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () => {
                      Provider.of<NavIndexNotifier>(context, listen: false)
                          .setIndex(1)
                    },
                    child: Container(
                        child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(flex: 1, child: Text("今日实收总金额")),
                              Image.asset("assets/jiantou.png",
                                  width: 7, height: 10),
                            ],
                          ),
                          Expanded(
                            flex: 1,
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 60, 0, 0),
                                    child: new CustomPaint(
                                      size: const Size(150.0, 150.0),
                                      painter: new CircleProgressBarPainter(
                                          progressBarTween
                                              .animate(animationController)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 80, 0, 0),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Text("总金额"),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              "${billNotifier?.data?.bill?.amount}"),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "${billNotifier?.data?.bill?.orderCount}"),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/hongdian.png",
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                        Text(
                                          "收款 (笔)",
                                          style: TextStyle(
                                              color: Color(0x66666666)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                          "${billNotifier?.data?.bill?.refundCount}"),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/landian.png",
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                        Text(
                                          "退款 (笔)",
                                          style: TextStyle(
                                              color: Color(0x66666666)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                  )),
            ],
          ),
        ),
      ],
    );

//     return new Scaffold(
//         body: new Column(children: <Widget>[
//       new Container(
//           height: Adapt.padTopH() + Adapt.px(90),
//           decoration: new BoxDecoration(
//               gradient: new LinearGradient(
//                   colors: [Style.mainColor, Style.mainLightColor])),
//           child: new HomeIndexPage()),
    //      new Expanded(
    //          child: new TabBarView(
    //        children: categoryPageList,
    //        controller: mController,
    //      )),
    //          new HomeIndexPage()
//     ], mainAxisSize: MainAxisSize.min));
  }
}
