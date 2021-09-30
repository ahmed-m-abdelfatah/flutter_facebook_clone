import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_main_styles.dart';

ThemeData myLightTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: MyMainColors.scaffold,
    focusColor: Colors.black,
    appBarTheme: _appBarTheme(context),
    tabBarTheme: _tabBarTheme(),
  );
}

TabBarTheme _tabBarTheme() {
  return TabBarTheme(
    unselectedLabelColor: Colors.grey,
    labelColor: MyMainColors.facebookBlue,
  );
}

AppBarTheme _appBarTheme(context) {
  return AppBarTheme(
    systemOverlayStyle: _statusbar(),
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: const TextStyle(
      color: MyMainColors.facebookBlue,
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      letterSpacing: -1.2,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );
}

SystemUiOverlayStyle _statusbar() {
  return SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  );
}
