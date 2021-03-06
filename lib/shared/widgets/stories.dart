import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/_models.dart';
import '../responsive/responsive.dart';
import '../styles/my_main_styles.dart';
import '_widgets.dart';

class Stories extends StatelessWidget {
  final UserModel currentUser;
  final List<StoryModel> stories;

  const Stories({
    required this.currentUser,
    required this.stories,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    return Container(
      height: isDesktop ? 200.0 : 240.0,
      color: !Responsive.isDesktop(context) ? Colors.white : Colors.transparent,
      child: ListView.builder(
        controller: ScrollController(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 8.0,
        ),
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }

          final story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final UserModel? currentUser;
  final StoryModel? story;

  const _StoryCard({
    this.isAddStory = false,
    this.currentUser,
    this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl:
                isAddStory ? currentUser!.profileImageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: MyMainColors.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: !Responsive.isDesktop(context)
                ? null
                : const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ],
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.add,
                      size: 30.0,
                      color: MyMainColors.facebookBlue,
                    ),
                    onPressed: () => print('Add To Story'),
                  ),
                )
              : ProfileAvatar(
                  profileImageUrl: story!.user.profileImageUrl,
                  hasBorder: !story!.isViewed,
                ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? "Add To Story" : story!.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
