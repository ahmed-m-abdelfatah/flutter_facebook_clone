import 'package:flutter/material.dart';

import '../styles/my_main_styles.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> icons;
  final bool isBottomIndicator;

  const CustomTabBar({
    required this.icons,
    this.isBottomIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MyMainColors.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      tabs: icons,
    );
  }
}
