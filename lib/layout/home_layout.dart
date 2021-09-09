import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/modules/feeds/feeds_tap.dart';
import 'package:flutter_facebook_clone/modules/groups/groups_tap.dart';
import 'package:flutter_facebook_clone/modules/menu/menu_tap.dart';
import 'package:flutter_facebook_clone/modules/notifications/notifications_tap.dart';
import 'package:flutter_facebook_clone/modules/profile/profile_tap.dart';
import 'package:flutter_facebook_clone/shared/components/widgets.dart';
import 'package:flutter_facebook_clone/shared/styles/my_main_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _tabs = [
      FeedsTap(),
      GroupsTap(),
      ProfileTap(),
      NotificationsTap(),
      MenuTap(),
    ];

    List<Widget> _tabsIcons = [
      Tab(icon: Icon(Icons.home, size: 25.0)),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: Tab(
          icon: Icon(Icons.groups_sharp, size: 25.0),
        ),
      ),
      Tab(icon: Icon(Icons.account_circle_outlined, size: 25.0)),
      Tab(
        icon: Transform.rotate(
          angle: -15 * (pi / 180),
          child: Icon(Icons.notifications, size: 25.0),
        ),
      ),
      Tab(icon: Icon(Icons.menu, size: 25.0))
    ];

    return SafeArea(
      child: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                title: const Text('Facebook'),
                toolbarHeight: 80.0,
                actions: [
                  CircleButton(
                    faIcon: false,
                    icon: Icons.search,
                    iconSize: 20.0,
                    onPressed: () => print('Search'),
                  ),
                  CircleButton(
                    faIcon: true,
                    icon: FontAwesomeIcons.facebookMessenger,
                    iconSize: 20.0,
                    onPressed: () => print('messenger'),
                  ),
                ],
                bottom: TabBar(
                  indicatorColor: Palette.facebookBlue,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Palette.facebookBlue,
                  tabs: _tabsIcons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
