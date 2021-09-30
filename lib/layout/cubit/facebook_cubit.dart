import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_clone/app_router.dart';
import 'package:flutter_facebook_clone/models/_models.dart';
import 'package:flutter_facebook_clone/modules/feeds_tab.dart';
import 'package:flutter_facebook_clone/modules/groups_tab.dart';
import 'package:flutter_facebook_clone/modules/menu_tab.dart';
import 'package:flutter_facebook_clone/modules/notifications_tab.dart';
import 'package:flutter_facebook_clone/modules/profile_tab.dart';
import 'package:flutter_facebook_clone/shared/repository/repository.dart';
import 'package:meta/meta.dart';

part 'facebook_state.dart';

class FacebookCubit extends Cubit<FacebookState> {
  FacebookCubit() : super(FacebookInitial());

  // make object from cubit
  static FacebookCubit get(context) => BlocProvider.of(context);

  // get all data from Repository
  UserModel currentUser = Repository.currentUser;
  List<UserModel> onlineUsers = Repository.onlineUsers;
  List<StoryModel> stories = Repository.stories;
  List<PostModel>? posts;

  void getPosts() {
    emit(GetDataLoading());

    Timer(const Duration(seconds: 2), () {
      posts = Repository.posts;

      emit(GetDataSuccess());
    });
  }
}

// out of bloc
class TabBarData {
  static List<Widget> tabs = [
    BlocProvider.value(
      value: AppRouter.facebookCubit,
      child: FeedsTab(),
    ),
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
