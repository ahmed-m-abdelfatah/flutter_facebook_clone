import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/models/user_model.dart';
import 'package:flutter_facebook_clone/shared/components/widgets.dart';
import 'package:flutter_facebook_clone/shared/styles/my_main_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final UserModel currentUser;
  final List<Widget> icons;
  final int currentIndex;
  final Function(int) onTap;

  const CustomAppBar({
    Key? key,
    required this.currentUser,
    required this.icons,
    required this.currentIndex,
    required this.onTap,
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
                color: Palette.facebookBlue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons: icons,
              currentIndex: currentIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // UserCard(user: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  onPressed: () => print('Search'),
                  radius: 50.0,
                  faIcon: false,
                ),
                CircleButton(
                  icon: FontAwesomeIcons.facebookMessenger,
                  iconSize: 30.0,
                  onPressed: () => print('Messenger'),
                  radius: 50.0,
                  faIcon: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
