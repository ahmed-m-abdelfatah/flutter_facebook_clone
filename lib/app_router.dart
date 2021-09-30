import 'package:flutter/material.dart';

import 'layout/home_layout.dart';
import 'modules/create_post.dart';

class AppRouter {
  static const String startScreen = '/';
  static const String homeLayout = '/home';
  static const String createPost = '/create-post';

  static Route? generateRoute(RouteSettings settings) {
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
      builder: (_) => HomeLayout(),
    );
  }

  static MaterialPageRoute<dynamic> _goToCreatePost() {
    return MaterialPageRoute(
      builder: (_) => CreatePost(),
    );
  }
}
