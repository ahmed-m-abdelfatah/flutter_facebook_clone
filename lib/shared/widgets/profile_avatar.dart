import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../styles/my_main_styles.dart';

class ProfileAvatar extends StatelessWidget {
  final String profileImageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    required this.profileImageUrl,
    this.isActive = false,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: MyMainColors.facebookBlue,
          radius: 20.0,
          child: CircleAvatar(
            radius: hasBorder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(
              profileImageUrl,
            ),
          ),
        ),
        if (isActive)
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 6.0,
            child: CircleAvatar(
              backgroundColor: MyMainColors.online,
              radius: 5.0,
            ),
          )
      ],
    );
  }
}
