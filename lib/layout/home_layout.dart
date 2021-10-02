import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../app_router.dart';
import '../shared/responsive/responsive.dart';
import '../shared/styles/my_main_styles.dart';
import '../shared/widgets/_widgets.dart';
import 'cubit/facebook_cubit.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout();

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    bool _notDesktop = !Responsive.isDesktop(context);

    return SafeArea(
      child: DefaultTabController(
        length: TabBarData.tabs.length,
        child: GestureDetector(
          onTap: _notDesktop ? null : () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: _buildAppBar(
              context: context,
              notDesktop: _notDesktop,
              screenSize: _screenSize,
            ),
            body: _buildHomeScreen(context),
          ),
        ),
      ),
    );
  }
}

PreferredSize _buildAppBar({
  required Size screenSize,
  required BuildContext context,
  required bool notDesktop,
}) {
  if (notDesktop) {
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
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRouter.searchScreen,
              );
              print('Search');
            },
          ),
          CircleButton(
            radius: 35.0,
            icon: Mdi.facebookMessenger,
            iconSize: 20.0,
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRouter.messengerScreen,
              );
              print('messenger');
            },
          ),
        ],
        bottom: TabBar(
          indicatorColor: MyMainColors.facebookBlue,
          tabs: TabBarData.tabsIcons,
        ),
      ),
    );
  }
  return PreferredSize(
    preferredSize: Size(screenSize.width, 100),
    child: CustomAppBar(
      currentUser: FacebookCubit.get(context).currentUser,
      icons: TabBarData.tabsIcons,
    ),
  );
}

Responsive _buildHomeScreen(BuildContext context) {
  return Responsive(
    mobile: TabBarView(
      children: TabBarData.tabs,
    ),
    desktop: Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(
                currentUser: FacebookCubit.get(context).currentUser,
              ),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          color: Colors.transparent,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: TabBarData.tabs,
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(
                onlineUsers: FacebookCubit.get(context).onlineUsers,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
