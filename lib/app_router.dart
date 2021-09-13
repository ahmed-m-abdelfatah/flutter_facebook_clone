import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/modules/create_post/create_post.dart';

import 'layout/home_layout.dart';

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
