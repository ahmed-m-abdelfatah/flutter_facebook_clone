import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../models/_models.dart';
import '../../styles/my_main_styles.dart';
// ignore: import_of_legacy_library_into_null_safe

import '_widgets.dart';

class CustomAppBar extends StatelessWidget {
  final UserModel currentUser;
  final List<Widget> icons;

  const CustomAppBar({
    Key? key,
    required this.currentUser,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'facebook',
              style: const TextStyle(
                color: MyMainColors.facebookBlue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(icons: icons),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(currentUser: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  onPressed: () => print('Search'),
                  radius: 50.0,
                ),
                CircleButton(
                  icon: Mdi.facebookMessenger,
                  iconSize: 30.0,
                  onPressed: () => print('Messenger'),
                  radius: 50.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
