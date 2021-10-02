import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../models/_models.dart';
import '../styles/my_main_styles.dart';
import '_widgets.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [Mdi.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [Mdi.accountMultiple, Colors.cyan, 'Friends'],
    [Mdi.facebookMessenger, MyMainColors.facebookBlue, 'Messenger'],
    [Mdi.flag, Colors.orange, 'Pages'],
    [Mdi.storefront, MyMainColors.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, MyMainColors.facebookBlue, 'Watch'],
    [Mdi.calendarStar, Colors.red, 'Events'],
  ];

  final UserModel currentUser;

  const MoreOptionsList({
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(currentUser: currentUser),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(
              icon: option[0],
              color: option[1],
              label: option[2],
            ),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(width: 6.0),
          // Flexible ? to not get error when text overflows
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
