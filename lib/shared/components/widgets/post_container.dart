import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../models/_models.dart';
import '../../_responsive/responsive.dart';
import '../../styles/my_main_styles.dart';
// ignore: import_of_legacy_library_into_null_safe

import '_widgets.dart';

class PostContainer extends StatelessWidget {
  final PostModel post;

  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    print('isDesktop -- $isDesktop');

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(height: 8.0),
                  Text(post.caption),
                  if (post.imageUrl != null && post.imagesUrls != null)
                    const SizedBox(height: 10.0),
                ],
              ),
            ),
            if (post.imageUrl != null) _photoContainer(),
            if (post.imagesUrls != null) _photoGallery(),
            _PostStats(post: post),
          ],
        ),
      ),
    );
  }

  Padding _photoContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CachedNetworkImage(imageUrl: post.imageUrl!),
    );
  }

  Padding _photoGallery() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CarouselSlider.builder(
            itemCount: post.imagesUrls!.length,
            options: CarouselOptions(
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIndex) {
              return CachedNetworkImage(
                imageUrl: post.imagesUrls![index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        )

        // AspectRatio(
        //   aspectRatio: 16 / 9,
        //   child: ClipRect(
        //     child: PhotoViewGallery.builder(
        //       itemCount: post.imagesUrls!.length,
        //       enableRotation: false,
        //       backgroundDecoration: BoxDecoration(color: Colors.black45),
        //       scrollPhysics: const BouncingScrollPhysics(),
        //       loadingBuilder: (context, event) {
        //         return Center(
        //           child: AdaptiveCircularProgressIndicator(
        //             os: OperatingSystem.getOs(),
        //           ),
        //         );
        //       },
        //       builder: (context, index) {
        //         print(post.imagesUrls![index]);

        //         return PhotoViewGalleryPageOptions(
        //           imageProvider: NetworkImage(post.imagesUrls![index]),
        //           minScale: PhotoViewComputedScale.contained * 0.6,
        //           initialScale: PhotoViewComputedScale.covered * 0.8,
        //           maxScale: PhotoViewComputedScale.covered * 2.0,
        //           heroAttributes: PhotoViewHeroAttributes(
        //             tag: post.imagesUrls![index],
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
        );
  }
}

class _PostHeader extends StatelessWidget {
  final PostModel post;

  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          profileImageUrl: post.user.profileImageUrl,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final PostModel post;

  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(height: 6.0),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: MyMainColors.facebookBlue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.thumb_up,
                  size: 10.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4.0),
              Expanded(
                child: Text(
                  '${post.likes}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Text(
                '${post.comments} Comments',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                '${post.shares} Shares',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            children: [
              _PostButton(
                icon: Icon(
                  Mdi.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: 'Like',
                onTap: () => print('Like'),
              ),
              _PostButton(
                icon: Icon(
                  Mdi.commentOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: 'Comment',
                onTap: () => print('Comment'),
              ),
              _PostButton(
                icon: Icon(
                  Mdi.shareOutline,
                  color: Colors.grey[600],
                  size: 25.0,
                ),
                label: 'Share',
                onTap: () => print('Share'),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap as void Function()?,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
