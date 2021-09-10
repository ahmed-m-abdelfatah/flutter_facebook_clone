import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/shared/styles/my_main_styles.dart';

class ProfileAvatar extends StatelessWidget {
  final String profileImageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    Key? key,
    required this.profileImageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(
            profileImageUrl,
          ),
        ),
        if (isActive)
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 6.0,
            child: CircleAvatar(
              backgroundColor: Palette.online,
              radius: 5.0,
            ),
          )
      ],
    );
  }
}
