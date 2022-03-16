import 'package:chat_app/const/colors.dart';
import 'package:chat_app/core/model/post.dart';
import 'package:chat_app/features/comment/cubit/comment_cubit.dart';
import 'package:chat_app/features/cubit/main_cubit.dart';
import 'package:chat_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
part 'units/comment_body.dart';
part 'units/cooment_bottom_nav.dart';
part 'units/profile_pic.dart';

class CommentView extends StatelessWidget {
  const CommentView({Key? key, required this.postData}) : super(key: key);
  final Post postData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentCubit()..geCommentData(postData.postId),
      child: Builder(builder: (context) {
        final cubit = CommentCubit.of(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: mobileBackgroundColor,
            title: const Text(
              'Comments',
            ),
            centerTitle: false,
          ),
          body: BlocBuilder<CommentCubit, CommentState>(
            builder: (context, state) {
              return state is CommentFetchDataFinshed
                  ? ListView.builder(
                      itemCount: cubit.comments.length,
                      itemBuilder: (context, index) {
                        final commentData = cubit.comments[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          child: Row(
                            children: [
                              const _ProfilePic(),
                              _CommentBody(commentData: commentData),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.favorite,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  : const LoadingIndicator();
            },
          ),
          // text input
          bottomNavigationBar: _CommentBottomNav(postData: postData),
        );
      }),
    );
  }
}
