import 'package:chat_app/const/colors.dart';
import 'package:chat_app/features/cubit/main_cubit.dart';
import 'package:chat_app/features/profile/cubit/profile_cubit.dart';
import 'package:chat_app/widgets/follow_button.dart';
import 'package:chat_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'units/profile_posts.dart';
part 'units/username_bio.dart';
part 'units/user_profile_pic.dart';
part 'units/user_stats.dart';
part 'units/follow_button.dart';
part 'units/username_title.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key, required this.uid}) : super(key: key);
  final String uid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserPosts(uid),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state is ProfileUserPostsFinshed
              ? Scaffold(
                  appBar: const _UserNameTitle(),
                  body: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const _UserProfilePIc(),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: const [
                                      _UserStats(),
                                      _FollowButton(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const _UsernameAndBio()
                          ],
                        ),
                      ),
                      const Divider(),
                      const _ProfilePosts(),
                    ],
                  ),
                )
              : const LoadingIndicator();
        },
      ),
    );
  }
}
