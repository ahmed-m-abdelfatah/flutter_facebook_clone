import 'dart:math';

import 'package:flutter/material.dart';

import '../../modules/feeds/feeds_tap.dart';
import '../../modules/groups/groups_tap.dart';
import '../../modules/menu/menu_tap.dart';
import '../../modules/notifications/notifications_tap.dart';
import '../../modules/profile/profile_tap.dart';

class TabBarData {
  static const List<Widget> tabs = [
    FeedsTap(),
    GroupsTap(),
    ProfileTap(),
    NotificationsTap(),
    MenuTap(),
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
