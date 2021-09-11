import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../shared/components/widgets.dart';
import '../../shared/network/local/repository/repository.dart';

class FeedsTap extends StatelessWidget {
  const FeedsTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          CreatePostContainer(currentUser: currentUser),
          const SizedBox(height: 10.0),
          Rooms(onlineUsers: onlineUsers),
          const SizedBox(height: 10.0),
          Stories(currentUser: currentUser, stories: stories),
          const SizedBox(height: 10.0),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              PostModel post = posts[index];
              return PostContainer(post: post);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10.0);
            },
            itemCount: posts.length,
          ),
          const SizedBox(
            height: 10.0,
            child: Center(
              child: Icon(
                Icons.more_horiz_sharp,
                color: Colors.black54,
                size: 22.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
