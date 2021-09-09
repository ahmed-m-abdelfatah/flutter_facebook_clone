import 'package:flutter_facebook_clone/models/models.dart';

class StoryModel {
  final UserModel user;
  final String imageUrl;
  final bool isViewed;

  const StoryModel({
    required this.user,
    required this.imageUrl,
    this.isViewed = false,
  });
}
