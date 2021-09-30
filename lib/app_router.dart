import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_clone/layout/cubit/facebook_cubit.dart';

import 'layout/home_layout.dart';
import 'modules/create_post.dart';

class AppRouter {
  static const String startScreen = '/';
  static const String homeLayout = '/home';
  static const String createPost = '/create-post';

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
      case createPost:
        return _goToCreatePost();
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

  static MaterialPageRoute<dynamic> _goToCreatePost() {
    return MaterialPageRoute(
      builder: (_) => CreatePost(),
    );
  }
}
