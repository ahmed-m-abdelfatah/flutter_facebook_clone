import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/shared/components/create_post_container.dart';
import 'package:flutter_facebook_clone/shared/network/local/repository/repository.dart';

class FeedsTap extends StatelessWidget {
  const FeedsTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CreatePostContainer(
            currentUser: currentUser,
          )
        ],
      ),
    );
  }
}
