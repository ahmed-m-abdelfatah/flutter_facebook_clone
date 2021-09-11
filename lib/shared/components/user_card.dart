import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:flutter_facebook_clone/shared/components/profile_avatar.dart';

class UserCard extends StatelessWidget {
  final UserModel currentUser;
  const UserCard({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

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
