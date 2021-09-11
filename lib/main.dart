import 'package:flutter/material.dart';

import 'app_router.dart';
import 'shared/styles/my_light_theme.dart';

void main()  => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      theme: myLightTheme(context),
    );
  }
}
