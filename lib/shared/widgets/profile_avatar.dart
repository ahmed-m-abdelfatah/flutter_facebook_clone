import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../styles/my_main_styles.dart';

class ProfileAvatar extends StatelessWidget {
  final String profileImageUrl;
  final bool isActive;
  final bool hasBorder;
  final double scale;
  final double isActivescale;

  const ProfileAvatar({
    required this.profileImageUrl,
    this.isActive = false,
    this.hasBorder = false,
    this.scale = 1.0,
    this.isActivescale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: MyMainColors.facebookBlue,
          radius: 20.0 * scale,
          child: CircleAvatar(
            radius: hasBorder ? 17.0 * scale : 20.0 * scale,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(
              profileImageUrl,
            ),
          ),
        ),
        if (isActive)
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 6.0 * isActivescale,
            child: CircleAvatar(
              backgroundColor: MyMainColors.online,
              radius: 5.0 * isActivescale,
            ),
          )
      ],
    );
  }
}
