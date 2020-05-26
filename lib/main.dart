import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytcardapp/model/notifier/BannerNotifier.dart';
import 'package:ytcardapp/service/service.dart';
import 'package:ytcardapp/utils/common.dart';
import 'page/LoginRoute.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(
        FutureProvider(
          initialData: BannerNotifier(),
          create: (context) => IndexService.getCarousel(),
          child: MyApp(),
        ),
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '世通卡商管端',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginRoute(),
    );
  }
}
