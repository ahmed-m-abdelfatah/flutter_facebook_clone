import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

import '../layout/cubit/facebook_cubit.dart';
import '../models/_models.dart';
import '../shared/_responsive/responsive.dart';
import '../shared/components/widgets/_widgets.dart';

class FeedsTab extends StatelessWidget {
  const FeedsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _feedsScrollController = ScrollController();

    return BlocConsumer<FacebookCubit, FacebookState>(
      listener: (context, state) {},
      builder: (context, state) {
        FacebookCubit _cubit = FacebookCubit.get(context);
        bool _notDesktop = !Responsive.isDesktop(context);

        return WillPopScope(
          onWillPop: () async {
            if (_feedsScrollController.offset > 0.0) {
              await _feedsScrollController.animateTo(
                0.0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              return false;
            } else {
              return true;
            }
          },
          child: SingleChildScrollView(
            key: PageStorageKey('FeedsTab'),
            controller: _feedsScrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _notDesktop
                    ? CreatePostContainer(currentUser: _cubit.currentUser)
                    : Stories(
                        currentUser: _cubit.currentUser,
                        stories: _cubit.stories,
                      ),
                const SizedBox(height: 10.0),
                _notDesktop
                    ? Rooms(onlineUsers: _cubit.onlineUsers)
                    : CreatePostContainer(currentUser: _cubit.currentUser),
                const SizedBox(height: 10.0),
                _notDesktop
                    ? Stories(
                        currentUser: _cubit.currentUser,
                        stories: _cubit.stories,
                      )
                    : Rooms(onlineUsers: _cubit.onlineUsers),
                const SizedBox(height: 10.0),
                Conditional.single(
                  context: context,
                  conditionBuilder: (context) => _cubit.posts != null,
                  widgetBuilder: (context) => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      PostModel post = _cubit.posts![index];

                      return PostContainer(post: post);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10.0);
                    },
                    itemCount: _cubit.posts!.length,
                  ),
                  fallbackBuilder: (context) => Container(
                    height: 300.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                if (_cubit.posts != null)
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    child: const Center(
                      child: Icon(
                        Icons.more_horiz_sharp,
                        color: Colors.black54,
                        size: 22.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
