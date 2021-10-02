import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_clone/layout/cubit/facebook_cubit.dart';

import '../shared/widgets/_widgets.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookCubit, FacebookState>(
      listener: (context, state) {},
      builder: (context, state) {
        ScrollController _scrollController = ScrollController();
        FacebookCubit _cubit = FacebookCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Row(
              children: [
                ProfileAvatar(
                  profileImageUrl: _cubit.currentUser.profileImageUrl,
                  scale: 0.8,
                ),
                const SizedBox(width: 15.0),
                Text(
                  'Chats',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            actions: [
              CircleButton(
                icon: Icons.camera_alt,
                iconSize: 20.0,
                radius: 35.0,
                onPressed: () {},
              ),
              CircleButton(
                icon: Icons.edit,
                iconSize: 20.0,
                radius: 35.0,
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 15),
                        Text(
                          'Search',
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    height: 100.0,
                    child: ListView.separated(
                      itemBuilder: (context, index) => _StoryItem(
                        cubit: _cubit,
                        index: index,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 15.0),
                      itemCount: _cubit.onlineUsers.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => _ChatItem(
                      cubit: _cubit,
                      index: index,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15.0),
                    itemCount: _cubit.onlineUsers.length,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ChatItem extends StatelessWidget {
  final FacebookCubit cubit;
  final int index;

  const _ChatItem({
    Key? key,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          profileImageUrl: cubit.onlineUsers[index].profileImageUrl,
          scale: 1.2,
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cubit.onlineUsers[index].name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Eu ipsum incididunt tempor enim ipsum culpa adipisicing deserunt mollit. Lorem Lorem labore Lorem aliqua culpa sunt. Qui dolore consequat tempor dolore incididunt incididunt sint quis fugiat deserunt anim. Est Lorem laboris adipisicing sint laborum consectetur ex tempor officia.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text('02:00 pm'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class _StoryItem extends StatelessWidget {
  final FacebookCubit cubit;
  final int index;

  const _StoryItem({
    Key? key,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAvatar(
            profileImageUrl: cubit.onlineUsers[index].profileImageUrl,
            isActive: true,
            scale: 1.1,
          ),
          const SizedBox(height: 15.0),
          Text(
            cubit.onlineUsers[index].name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
