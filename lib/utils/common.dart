import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ytcardapp/page/LoginRoute.dart';

import '../index.dart';
import 'net-utils.dart';

class Global {
  //初始化全局信息，会在APP启动时执行
  static Future init() {
    return NetUtil.init();
  }
  static GlobalKey<NavigatorState> navigatorState = new GlobalKey();

  static route(BuildContext ctx, int code) {
    if (code == 200) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) =>   new IndexPage()));
    }
  }
}
