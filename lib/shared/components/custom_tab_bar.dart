import 'package:flutter/material.dart';

import '../styles/my_main_styles.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> icons;

  const CustomTabBar({
    Key? key,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      tabs: icons,
    );
  }
}
