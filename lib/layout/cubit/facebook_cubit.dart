import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'facebook_state.dart';

class FacebookCubit extends Cubit<FacebookState> {
  FacebookCubit() : super(FacebookInitial());

  // make object of the cubit
  static FacebookCubit get(context) => BlocProvider.of(context);

  // start tap bar items using IndexedStack
  // int currentIndex = 0;

  // final List<Widget> tabs = [
  //   FeedsTap(),
  //   GroupsTap(),
  //   ProfileTap(),
  //   NotificationsTap(),
  //   MenuTap(),
  // ];

  // final List<Widget> tabsIcons = [
  //   Tab(icon: Icon(Icons.home, size: 25.0)),
  //   Container(
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       border: Border.all(color: Colors.grey, width: 2.0),
  //     ),
  //     child: Tab(
  //       icon: Icon(Icons.groups_sharp, size: 20.0),
  //     ),
  //   ),
  //   Tab(icon: Icon(Icons.account_circle_outlined, size: 27.0)),
  //   Tab(
  //     icon: Transform.rotate(
  //       angle: -15 * (pi / 180),
  //       child: Icon(Icons.notifications, size: 23.0),
  //     ),
  //   ),
  //   Tab(icon: Icon(Icons.menu, size: 25.0))
  // ];

  // void changeTabBar(int index) {
  //   currentIndex = index;
  //   emit(ChangeTabBar());
  // }
}
