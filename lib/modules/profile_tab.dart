import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/cubit/facebook_cubit.dart';
import '../shared/widgets/_widgets.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab();

  @override
  Widget build(BuildContext context) {
    ScrollController _profileScrollController = ScrollController();
    FacebookCubit _cubit = FacebookCubit.get(context);

    return BlocConsumer<FacebookCubit, FacebookState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          controller: _profileScrollController,
          child: Column(
            children: [
              _CurrentUserNameAndPhoto(cubit: _cubit),
              const Divider(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: _CurrentUserIcons(),
              ),
              const Divider(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: _FrendsBox(cubit: _cubit),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CurrentUserNameAndPhoto extends StatelessWidget {
  const _CurrentUserNameAndPhoto({
    Key? key,
    required FacebookCubit cubit,
  })  : _cubit = cubit,
        super(key: key);

  final FacebookCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 260.0,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      'https://i.picsum.photos/id/528/700/700.jpg?hmac=jeoiMFuAkVPXKmxRnfr1dybhOZJcmthNPjKcBNw-43A',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, 50.0),
                child: Center(
                  child: ProfileAvatar(
                    profileImageUrl: _cubit.currentUser.profileImageUrl,
                    scale: 3.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            _cubit.currentUser.name,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              _MyTextButton(
                text: 'Add to Story',
              ),
              const SizedBox(width: 15.0),
              Container(
                height: 40.0,
                width: 45.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(Icons.more_horiz),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _CurrentUserIcons extends StatelessWidget {
  final List<List> _iconsData = [
    [Icons.home, 'Lives in New York'],
    [Icons.location_on, 'From New York'],
    [Icons.more_horiz, 'See your About Info'],
  ];

  _CurrentUserIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _buildIconRow(
            _iconsData[index][0],
            _iconsData[index][1],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 15.0),
          itemCount: _iconsData.length,
        ),
        const SizedBox(height: 15.0),
        Row(
          children: [
            _MyTextButton(
              text: 'Edit Public Details',
              bgColor: Colors.lightBlueAccent.withOpacity(0.25),
              textColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconRow(IconData icon, String text) {
    return InkWell(
      onTap: () => print(text),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey,
            size: 30.0,
          ),
          const SizedBox(width: 10.0),
          Text(
            text,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class _FrendsBox extends StatelessWidget {
  final FacebookCubit cubit;

  const _FrendsBox({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Friends',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  '536 friends',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            TextButton(
              child: Text(
                'Find Friends',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
              onPressed: () => print('Find Friends'),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: (90.0 / 140.0),
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return _friendItem(
              userImage: cubit.onlineUsers[index].profileImageUrl,
              userName: cubit.onlineUsers[index].name,
            );
          },
        ),
        const SizedBox(height: 15.0),
        Row(
          children: [
            _MyTextButton(
              text: 'See All Friends',
              bgColor: Colors.grey.shade300,
              textColor: Colors.black,
            ),
          ],
        ),
      ],
    );
  }

  Widget _friendItem({
    required String userImage,
    required String userName,
  }) {
    return Column(
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red,
              image: DecorationImage(
                image: CachedNetworkImageProvider(userImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          userName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _MyTextButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const _MyTextButton({
    Key? key,
    required this.text,
    this.bgColor = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => print(text),
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
