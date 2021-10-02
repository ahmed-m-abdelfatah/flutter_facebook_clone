import 'package:flutter/material.dart';

import '../../../models/_models.dart';
import '_widgets.dart';

class UserCard extends StatelessWidget {
  final UserModel currentUser;
  
  const UserCard({
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('Profile'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(profileImageUrl: currentUser.profileImageUrl),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              currentUser.name,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
