import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/modules/profile_tab.dart';

import '../../modules/feeds_tab.dart';
import '../../modules/groups_tab.dart';
import '../../modules/menu_tab.dart';
import '../../modules/notifications_tab.dart';

class TabBarData {
  static const List<Widget> tabs = [
    FeedsTab(),
    GroupsTab(),
    ProfileTab(),
    NotificationsTab(),
    MenuTab(),
  ];

  static final List<Widget> tabsIcons = [
    Tab(icon: Icon(Icons.home, size: 25.0)),
    Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 2.0),
      ),
      child: Tab(
        icon: Icon(Icons.groups_sharp, size: 20.0),
      ),
    ),
    Tab(icon: Icon(Icons.account_circle_outlined, size: 27.0)),
    Tab(
      icon: Transform.rotate(
        angle: -15 * (pi / 180),
        child: Icon(Icons.notifications, size: 23.0),
      ),
    ),
    Tab(icon: Icon(Icons.menu, size: 25.0))
  ];
}
