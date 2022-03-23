import 'package:chat_app/const/colors.dart';
import 'package:chat_app/features/cubit/main_cubit.dart';
import 'package:chat_app/features/feed/cubit/feed_cubit.dart';
import 'package:chat_app/features/profile/cubit/profile_cubit.dart';
import 'package:chat_app/widgets/follow_button.dart';
import 'package:chat_app/widgets/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'units/profile_posts.dart';
part 'units/username_bio.dart';
part 'units/user_profile_pic.dart';
part 'units/user_stats.dart';
part 'units/follow_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserPosts(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Text('username'),
          centerTitle: false,
        ),
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
      ),
    );
  }
}
