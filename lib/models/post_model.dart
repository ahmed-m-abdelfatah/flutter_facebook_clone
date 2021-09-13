import 'user_model.dart';

class PostModel {
  final UserModel user;
  final String caption;
  final String timeAgo;
  final String? imageUrl;
  final List<String>? imagesUrls;
  final int likes;
  final int comments;
  final int shares;

  const PostModel({
    required this.user,
    required this.caption,
    required this.timeAgo,
    this.imageUrl,
    this.imagesUrls,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
