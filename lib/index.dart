import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ytcardapp/page/fristPage.dart';
import 'package:ytcardapp/theme.dart';
import 'package:ytcardapp/utils/bottom-nav-item.dart';

import 'model/notifier/NavIndexNotifier.dart';
import 'page/billListPage.dart';
import 'page/user-center.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {
  List<BottomNavItem> tabImages;
  List _pageList;
  var _tabIndex = 0;

  void handleTabChange(index) {
    this.setState(() {
      _tabIndex = index;
    });
  }

  void initData() {
    tabImages = [
      new BottomNavItem(
          icon: 'assets/home.png',
          selectedIcon: 'assets/home-fill.png',
          title: '首页'),
      new BottomNavItem(
          icon: 'assets/line-chart.png',
          selectedIcon: 'assets/area-chart-fill.png',
          title: '交易记录'),
//      new BottomNavItem(
//          icon: 'assets/line-chart.png',
//          selectedIcon: 'assets/area-chart-fill.png',
//          title: '收益'),
      new BottomNavItem(
          icon: 'assets/bulb.png',
          selectedIcon: 'assets/bulb-fill.png',
          title: '我的'),
    ];
    _pageList = [
      new HomeRoutePage(),
      new BillListPage(),
//      new SearchPage(),
      new UserCenterPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    var index = Provider.of<NavIndexNotifier>(context).index;
    print('$index');
    initData();

    var bar = BottomNavigationBar(
      onTap: handleTabChange,
      currentIndex: _tabIndex,
      type: BottomNavigationBarType.fixed,
      items: tabImages.map((item) {
        return BottomNavigationBarItem(
            title: new Text(item.title,
                style: TextStyle(color: Style.mainTextColor)),
            icon: Image.asset(tabImages.indexOf(item) != _tabIndex
                ? item.icon
                : item.selectedIcon));
      }).toList(),
    );

    return Scaffold(
      body: _pageList[_tabIndex],
      bottomNavigationBar: Consumer<NavIndexNotifier>(
        builder: (context, navIndex, child) {
          _tabIndex = index;
          return bar;
        },
      ),
    );
  }
}
