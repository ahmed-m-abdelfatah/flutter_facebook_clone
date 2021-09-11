import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/components/my_constants.dart';
import '../shared/components/widgets.dart';
import '../shared/network/local/repository/repository.dart';
import '../shared/styles/my_main_styles.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
              mobile: _buildHomeScreen(),
              desktop: _buildHomeScreenDesktop(),
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

  TabBarView _buildHomeScreen() => TabBarView(children: MyConstants.tabs);

  Widget _buildHomeScreenDesktop() {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.orange,
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0, // container -> w600 {custom tap bar}
          color: Colors.orange,
          child: _buildHomeScreen(),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
