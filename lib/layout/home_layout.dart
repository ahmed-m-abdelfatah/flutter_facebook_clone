import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_clone/layout/cubit/facebook_cubit.dart';
import 'package:mdi/mdi.dart';

import '../shared/_responsive/responsive.dart';
import '../shared/components/widgets/_widgets.dart';
import '../shared/styles/my_main_styles.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        length: TabBarData.tabs.length,
        child: GestureDetector(
          // tap any where to remove foucs from text field
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocConsumer<FacebookCubit, FacebookState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: !Responsive.isDesktop(context)
                    ? _buildAppBarMobile()
                    : _buildAppBarDesktop(screenSize, context),
                body: _BuildHomeScreen(),
              );
            },
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBarMobile() {
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
          indicatorColor: MyMainColors.facebookBlue,
          tabs: TabBarData.tabsIcons,
        ),
      ),
    );
  }

  PreferredSize _buildAppBarDesktop(screenSize, context) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 100),
      child: CustomAppBar(
        currentUser: FacebookCubit.get(context).currentUser,
        icons: TabBarData.tabsIcons,
      ),
    );
  }
}

class _BuildHomeScreen extends StatelessWidget {
  const _BuildHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: TabBarView(children: TabBarData.tabs),
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
            width: 600.0, // container -> w600 {custom tap bar}
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
                    onlineUsers: FacebookCubit.get(context).onlineUsers),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
