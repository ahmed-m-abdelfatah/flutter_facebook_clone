import 'package:flutter/material.dart';

import '../../../app_router.dart';
import '../../../models/_models.dart';
import '../../_responsive/responsive.dart';
import '_widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final UserModel currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(profileImageUrl: currentUser.profileImageUrl),
                const SizedBox(width: 8.0),
                Expanded(
                  child: isDesktop
                      ? TextField(
                          // collapsed to remove the underline
                          decoration: InputDecoration.collapsed(
                            hintText: "What\'s on your mind?",
                          ),
                        )
                      : OutlinedButton(
                          child: Text(
                            "What\'s on your mind?",
                            style: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRouter.createPost);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
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
      ),
    );
  }
}
