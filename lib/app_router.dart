import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/facebook_cubit.dart';
import 'layout/home_layout.dart';
import 'modules/create_post_screen.dart';
import 'modules/messenger_screen.dart';
import 'modules/search_screnn.dart';

class AppRouter {
  static const String startScreen = '/';
  static const String homeLayout = '/home';
  static const String createPostScreen = '/create-post';
  static const String searchScreen = '/search';
  static const String messengerScreen = '/messenger';

  static FacebookCubit facebookCubit = FacebookCubit();
  void dispose() {
    facebookCubit.close();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startScreen:
        return _startScreen();
      case homeLayout:
        return _goToHomeLayout();
      case createPostScreen:
        return _goToCreatePostScreen();
      case searchScreen:
        return _goToSearchScreen();
      case messengerScreen:
        return _goToMessengerScreen();
      default:
        return _startScreen();
    }
  }

  static MaterialPageRoute<dynamic>? _startScreen() => _goToHomeLayout();

  static MaterialPageRoute<dynamic> _goToHomeLayout() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: facebookCubit,
        child: HomeLayout(),
      ),
    );
  }

  static MaterialPageRoute<dynamic> _goToCreatePostScreen() {
    return MaterialPageRoute(
      builder: (_) => CreatePostScreen(),
    );
  }

  static MaterialPageRoute<dynamic> _goToSearchScreen() {
    return MaterialPageRoute(
      builder: (_) => SearchScreen(),
    );
  }

  static MaterialPageRoute<dynamic> _goToMessengerScreen() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: facebookCubit,
        child: MessengerScreen(),
      ),
    );
  }
}
