import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/shared/_responsive/responsive.dart';
import 'package:flutter_facebook_clone/shared/components/widgets/widgets.dart';
import 'package:mdi/mdi.dart';

// ignore: import_of_legacy_library_into_null_safe

import '../shared/components/my_constants.dart';
import '../shared/network/local/repository/repository.dart';
import '../shared/styles/my_main_styles.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        length: MyConstants.tabs.length,
        child: GestureDetector(
          // tap any where to remove foucs from text field
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: !Responsive.isDesktop(context)
                ? _buildAppBar()
                : _buildAppBarDesktop(screenSize),
            body: Responsive(
              mobile: _BuildHomeScreen(),
              desktop: _BuildHomeScreenDesktop(),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(120.0),
      child: AppBar(
        title: const Text('Facebook'),
        toolbarHeight: 80.0,
        actions: [
          CircleButton(
            radius: 35.0,
            icon: Icons.search,
            iconSize: 20.0,
            onPressed: () => print('Search'),
          ),
          CircleButton(
            radius: 35.0,
            icon: Mdi.facebookMessenger,
            iconSize: 20.0,
            onPressed: () => print('messenger'),
          ),
        ],
        bottom: TabBar(
          indicatorColor: Palette.facebookBlue,
          tabs: MyConstants.tabsIcons,
        ),
      ),
    );
  }

  PreferredSize _buildAppBarDesktop(screenSize) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 100),
      child: CustomAppBar(
        currentUser: currentUser,
        icons: MyConstants.tabsIcons,
      ),
    );
  }
}

class _BuildHomeScreen extends StatelessWidget {
  const _BuildHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: MyConstants.tabs);
  }
}

class _BuildHomeScreenDesktop extends StatelessWidget {
  const _BuildHomeScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0, // container -> w600 {custom tap bar}
          color: Colors.transparent,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: MyConstants.tabs,
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(onlineUsers: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
