import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytcardapp/model/notifier/BannerNotifier.dart';
import 'package:ytcardapp/model/notifier/BillNotifier.dart';
import 'package:ytcardapp/model/notifier/NetNotifier.dart';
import 'package:ytcardapp/service/service.dart';
import 'package:ytcardapp/utils/common.dart';

import 'model/notifier/BillListNotifier.dart';
import 'model/notifier/NavIndexNotifier.dart';
import 'page/LoginRoute.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(
        MultiProvider(providers: [
          FutureProvider(
            initialData: BannerNotifier(),
            create: (context) => NetService.getCarousel(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return NetNotify();
            },
          ),
          FutureProvider(
            initialData: BillNotifier(),
            create: (context) => NetService.bill(),
          ),
          ChangeNotifierProvider.value(value: NavIndexNotifier()),
          ChangeNotifierProvider.value(value: BillListNotifier())
        ], child: MyApp()),
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Global.navigatorState,

      title: '世通卡商管端',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: [BotToastNavigatorObserver()],
      //2.注册路由观察者
      home: LoginRoute(),
    );
  }
}
