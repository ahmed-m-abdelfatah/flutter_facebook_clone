import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_clone/shared/styles/my_main_styles.dart';

ThemeData myLightTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Palette.scaffold,
    focusColor: Colors.black,
    appBarTheme: _appBarTheme(context),
    tabBarTheme: _tabBarTheme(),
  );
}

TabBarTheme _tabBarTheme() {
  return TabBarTheme(
    unselectedLabelColor: Colors.grey,
    labelColor: Palette.facebookBlue,
  );
}

AppBarTheme _appBarTheme(context) {
  return AppBarTheme(
    // backwardsCompatibility: false, to edit status bar
    backwardsCompatibility: false,
    systemOverlayStyle: statusbar(),
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: const TextStyle(
      color: Palette.facebookBlue,
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      letterSpacing: -1.2,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );
}

SystemUiOverlayStyle statusbar() {
  return SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  );
}
