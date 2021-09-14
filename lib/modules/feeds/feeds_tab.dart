import 'package:flutter/material.dart';

import '../../models/_models.dart';
import '../../shared/_responsive/responsive.dart';
import '../../shared/components/widgets/_widgets.dart';
import '../../shared/repository/repository.dart';

class FeedsTab extends StatelessWidget {
  const FeedsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _feedsScrollController = ScrollController();
    return WillPopScope(
      onWillPop: () async {
        if (_feedsScrollController.offset > 0.0) {
          await _feedsScrollController.animateTo(
            0.0,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
          return false;
        } else {
          return true;
        }
      },
      child: SingleChildScrollView(
        controller: _feedsScrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: !Responsive.isDesktop(context)
              ? _buildFeeds(context)
              : _buildFeedsDesktop(context),
        ),
      ),
    );
  }

  List<Widget> _buildFeeds(BuildContext context) {
    return [
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
    ];
  }

  List<Widget> _buildFeedsDesktop(BuildContext context) {
    return [
      Stories(currentUser: currentUser, stories: stories),
      const SizedBox(height: 10.0),
      CreatePostContainer(currentUser: currentUser),
      const SizedBox(height: 10.0),
      Rooms(onlineUsers: onlineUsers),
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
    ];
  }
}
