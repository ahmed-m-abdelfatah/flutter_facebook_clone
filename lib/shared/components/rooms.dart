import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/models/user_model.dart';
import 'package:flutter_facebook_clone/shared/styles/my_main_styles.dart';

class Rooms extends StatelessWidget {
  final List<UserModel> onlineUsers;

  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
            );
          }
          return Container(
            margin: const EdgeInsets.all(2.0),
            height: 20.0,
            width: 20.0,
            color: Colors.black,
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('create room'),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(
          width: 5.0,
          color: Colors.blueAccent.withOpacity(0.4),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return Palette.createRoomGradient.createShader(rect);
            },
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          Text(
            'create\nroom',
            style: TextStyle(color: Palette.facebookBlue),
          ),
        ],
      ),
    );
  }
}
