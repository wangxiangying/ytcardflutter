import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adapt.dart';
import 'bottom-nav-item.dart';

class CustomBottomNav extends StatelessWidget {
  List<BottomNavItem> bottomNavItems;

  Function onTab;

  CustomBottomNav(this.bottomNavItems, this.onTab, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('refresh');
    return new BottomNavigationBar(
      onTap: this.onTab,
        items: this.bottomNavItems.map((item) {
      return new BottomNavigationBarItem(
          icon: Image.asset(item.icon, width: Adapt.px(16), height: Adapt.px(16)),
          title: new Text(
            item.title,
            style: TextStyle(color: Colors.red),
          ));
    }).toList());
  }
}
