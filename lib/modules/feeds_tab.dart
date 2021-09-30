import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_facebook_clone/layout/cubit/facebook_cubit.dart';
import 'package:flutter_facebook_clone/shared/_adaptive/adaptive_circular_progress_indicator.dart';
import 'package:flutter_facebook_clone/shared/_adaptive/operating_system.dart';

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
        FacebookCubit cubit = FacebookCubit.get(context);

        return WillPopScope(
          onWillPop: () async {
            if (_feedsScrollController.offset > 0.0) {
              await _feedsScrollController.animateTo(
                0.0,
                duration: Duration(seconds: 1),
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
              children: [
                Responsive(
                  mobile: CreatePostContainer(currentUser: cubit.currentUser),
                  desktop: Stories(
                      currentUser: cubit.currentUser, stories: cubit.stories),
                ),
                const SizedBox(height: 10.0),
                Responsive(
                  mobile: Rooms(onlineUsers: cubit.onlineUsers),
                  desktop: CreatePostContainer(currentUser: cubit.currentUser),
                ),
                const SizedBox(height: 10.0),
                Responsive(
                  mobile: Stories(
                      currentUser: cubit.currentUser, stories: cubit.stories),
                  desktop: Rooms(onlineUsers: cubit.onlineUsers),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: Conditional.single(
                    context: context,
                    conditionBuilder: (context) => cubit.posts != null,
                    widgetBuilder: (context) => ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        PostModel post = cubit.posts![index];

                        return PostContainer(post: post);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10.0);
                      },
                      itemCount: cubit.posts!.length,
                    ),
                    fallbackBuilder: (context) => Center(
                      child: AdaptiveCircularProgressIndicator(
                          os: OperatingSystem.getOs()),
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
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
