import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adapt.dart';
import 'bottom-nav-item.dart';

// ignore: must_be_immutable
class CustomBottomNav extends StatefulWidget {
  List<BottomNavItem> bottomNavItems;
  Function onTab;

  CustomBottomNav(this.bottomNavItems, this.onTab, {Key key}) : super(key: key);

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
        onTap: this.widget.onTab,
        items: this.widget.bottomNavItems.map((item) {
          return new BottomNavigationBarItem(
              icon: Image.asset(item.icon,
                  width: Adapt.px(16), height: Adapt.px(16)),
              title: new Text(
                item.title,
                style: TextStyle(color: Colors.red),
              ));
        }).toList());
  }
}
