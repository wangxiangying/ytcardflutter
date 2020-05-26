import 'package:flutter/material.dart';
import 'package:ytcardapp/page/fristPage.dart';
 import 'package:ytcardapp/theme.dart';
 import 'package:ytcardapp/utils/bottom-nav-item.dart';

import 'page/activity.dart';
import 'page/search.dart';
import 'page/user-center.dart';



class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {

  var appBarTitles = ['首页', '活动', '收益', '我的'];

  List<BottomNavItem> tabImages;

  List _pageList;

  var _tabIndex = 0;

  void handleTabChange(index) {
    _tabIndex = index;
    this.setState((){});
  }

  void initData() {
    tabImages = [
      new BottomNavItem(
          icon: 'assets/home.png',
          selectedIcon: 'assets/home-fill.png',
          title: '首页'),
      new BottomNavItem(
          icon: 'assets/bulb.png',
          selectedIcon: 'assets/bulb-fill.png',
          title: '活动'),
      new BottomNavItem(
          icon: 'assets/line-chart.png',
          selectedIcon: 'assets/area-chart-fill.png',
          title: '收益'),
      new BottomNavItem(
          icon: 'assets/user.png',
          selectedIcon: 'assets/user.png',
          title: '我的'),
    ];
    _pageList = [
      new HomeRoutePage(),
      new ActivityPage(),
      new SearchPage(),
      new UserCenterPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
      body: _pageList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: handleTabChange,
        type: BottomNavigationBarType.fixed,
        items: tabImages.map((item) {
          return BottomNavigationBarItem(
            title: new Text(item.title, style: TextStyle(color: Style.mainTextColor)),
            icon: Image.asset(tabImages.indexOf(item) != _tabIndex ? item.icon : item.selectedIcon)
          );
        }).toList(),
      ),
    );
  }
}
