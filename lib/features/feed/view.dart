import 'package:chat_app/const/colors.dart';
import 'package:chat_app/core/model/post.dart';
import 'package:chat_app/features/cubit/main_cubit.dart';
import 'package:chat_app/features/feed/cubit/feed_cubit.dart';
import 'package:chat_app/widgets/like_animation.dart';
import 'package:chat_app/widgets/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
part 'units/caption_comment.dart';
part 'units/like_comment_section.dart';
part 'units/post_card_header.dart';
part 'units/post_card_image.dart';

part 'units/app_bar.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = FeedCubit.of(context);
    return Scaffold(
      appBar: _appBar(),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          return cubit.post.isNotEmpty
              ? ListView.builder(
                  itemCount: cubit.post.length,
                  itemBuilder: (context, index) {
                    final postData = cubit.post[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: mobileBackgroundColor,
                        ),
                        color: mobileBackgroundColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          _PostCardHeader(data: postData),
                          _PostCardImage(data: postData),
                          _LikeCommentSection(data: postData),
                          _CaptionAndComments(data: postData),
                        ],
                      ),
                    );
                  },
                )
              : const LoadingIndicator();
        },
      ),
    );
  }
}
