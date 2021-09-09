import 'dart:math';

import 'package:flutter/gestures.dart';
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
  HomeLayout({Key? key}) : super(key: key);

  final List<Widget> _tabs = [
    FeedsTap(),
    GroupsTap(),
    ProfileTap(),
    NotificationsTap(),
    MenuTap(),
  ];

  final List<Widget> _tabsIcons = [
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                _buildSliverAppBar(),
              ];
            },
            // slivers:
            body: _buildBody(),
          ),
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      title: const Text('Facebook'),
      toolbarHeight: 80.0,
      actions: [
        CircleButton(
          radius: 35.0,
          faIcon: false,
          icon: Icons.search,
          iconSize: 20.0,
          onPressed: () => print('Search'),
        ),
        CircleButton(
          radius: 35.0,
          faIcon: true,
          icon: FontAwesomeIcons.facebookMessenger,
          iconSize: 20.0,
          onPressed: () => print('messenger'),
        ),
      ],
      bottom: TabBar(
        indicatorColor: Palette.facebookBlue,
        tabs: _tabsIcons,
      ),
    );
  }

  Widget _buildBody() => Container(
        child: TabBarView(
          children: _tabs,
          dragStartBehavior: DragStartBehavior.start,
        ),
      );
}
