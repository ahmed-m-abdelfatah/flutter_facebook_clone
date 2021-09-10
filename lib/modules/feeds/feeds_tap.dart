import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/shared/components/widgets.dart';
import 'package:flutter_facebook_clone/shared/network/local/repository/repository.dart';

class FeedsTap extends StatelessWidget {
  const FeedsTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CreatePostContainer(currentUser: currentUser),
          const SizedBox(height: 10.0),
          Rooms(onlineUsers: onlineUsers),
        ],
      ),
    );
  }
}
