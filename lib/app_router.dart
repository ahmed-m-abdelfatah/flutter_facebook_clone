import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_clone/layout/cubit/facebook_cubit.dart';
import 'package:flutter_facebook_clone/layout/home_layout.dart';

class AppRouter {
  static const String startScreen = '/';
  static const String homeLayout = '/home';

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startScreen:
        return _startScreen();
      case homeLayout:
        return _goToHomeLayout();
      default:
        return _startScreen();
    }
  }

  static MaterialPageRoute<dynamic>? _startScreen() => _goToHomeLayout();

  static MaterialPageRoute<dynamic> _goToHomeLayout() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => FacebookCubit(),
        child: HomeLayout(),
      ),
    );
  }
}
