import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import 'widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final UserModel currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(profileImageUrl: currentUser.profileImageUrl),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  // collapsed to remove the underline
                  decoration: InputDecoration.collapsed(
                    hintText: "What\'s on your mind?",
                  ),
                ),
              )
            ],
          ),
          const Divider(height: 10.0, thickness: 0.5),
          Container(
            // edit height of buttons and show VerticalDividers
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => print('Live'),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Live',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(width: 8.0),
                TextButton.icon(
                  onPressed: () => print('Photo'),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text(
                    'Photo',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(width: 8.0),
                TextButton.icon(
                  onPressed: () => print('Room'),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: const Text(
                    'Room',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
