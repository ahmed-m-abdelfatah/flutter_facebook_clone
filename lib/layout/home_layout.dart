import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_clone/layout/cubit/facebook_cubit.dart';
import 'package:flutter_facebook_clone/shared/components/widgets.dart';
import 'package:flutter_facebook_clone/shared/network/local/repository/repository.dart';
import 'package:flutter_facebook_clone/shared/styles/my_main_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return BlocConsumer<FacebookCubit, FacebookState>(
      listener: (context, state) {},
      builder: (context, state) {
        FacebookCubit cubit = FacebookCubit.get(context);
        return SafeArea(
          child: DefaultTabController(
            length: cubit.tabs.length,
            child: Scaffold(
              appBar: !Responsive.isDesktop(context)
                  ? _buildAppBar(cubit)
                  : _buildAppBarDesktop(screenSize, cubit),
              body: _buildBody(cubit),
            ),
          ),
        );
      },
    );
  }

  PreferredSize _buildAppBar(cubit) {
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
          tabs: cubit.tabsIcons,
        ),
      ),
    );
  }

  PreferredSize _buildAppBarDesktop(screenSize, cubit) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 100),
      child: CustomAppBar(
        currentUser: currentUser,
        icons: cubit.tabsIcons,
        currentIndex: cubit.currentIndex,
        onTap: cubit.changeTabBar,
      ),
    );
  }

  Widget _buildBody(cubit) {
    return TabBarView(
      children: cubit.tabs,
    );
  }
}
