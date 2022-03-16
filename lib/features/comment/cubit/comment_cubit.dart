import 'package:bloc/bloc.dart';
import 'package:chat_app/widgets/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  static CommentCubit of(context) => BlocProvider.of(context);
  final TextEditingController commentEditingController =
      TextEditingController();
  final _fireStore = FirebaseFirestore.instance;
  List comments = [];

  Future<void> postComment(
    String postId,
    String uid,
    String userName,
    String profilePic,
  ) async {
    try {
      if (commentEditingController.toString().isNotEmpty) {
        String commentId = const Uuid().v1();
        await _fireStore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'userName': userName,
          'uid': uid,
          'comment': commentEditingController.text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        commentEditingController.text = '';
      } else {
        showSnackBar('Comment is Empty');
      }
    } catch (e) {
      showSnackBar(e.toString(), isError: true);
    }
  }

  geCommentData(String postId) {
    _fireStore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .orderBy('datePublished')
        .snapshots()
        .listen(
      (event) {
        comments = [];
        event.docs.forEach(
          (element) {
            comments.add(element.data());
            emit(CommentFetchDataFinshed());
          },
        );
      },
    );
  }
}
