import 'dart:async';

import 'package:chat_app/core/model/post.dart';
import 'package:chat_app/widgets/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedInitial());
  static FeedCubit of(context) => BlocProvider.of(context);

  List<Post> post = [];

  final _firestore = FirebaseFirestore.instance;

  Future fetchData() async {
    emit(Feedloading());

    await _firestore.collection('posts').get().then(
          (querySnapshot) => {
            querySnapshot.docs.forEach(
              (element) {
                Post _post = Post.fromJson(element.data());
                post.add(_post);
              },
            )
          },
        );
    emit(FeedFinshedloading());
  }

  getPostData() async {
    emit(Feedloading());
    _firestore
        .collection('posts')
        .orderBy('postDate')
        .snapshots()
        .listen((event) {
      post = [];
      for (var element in event.docs) {
        Post _post = Post.fromJson(element.data());
        post.add(_post);
      }
      emit(FeedFinshedloading());
    });
  }

  // Future<void> likePost(String postId, String uid, List likes) async {
  //   try {
  //     if (likes.contains(uid)) {
  //       await _firestore.collection('posts').doc(postId).update({
  //         'likes': FieldValue.arrayRemove([uid]),
  //       });
  //       // startUnLikeAnimetaion();
  //     } else {
  //       await _firestore.collection('posts').doc(postId).update({
  //         'likes': FieldValue.arrayUnion([uid]),
  //       });

  //       // startLikeAnimetaion();
  //     }
  //   } catch (e) {
  //     showSnackBar(e.toString(), isError: true);
  //   }
  // }

  // void startLikeAnimetaion() {
  //   emit(FeedLikAnimationStart());
  // }

  // void startUnLikeAnimetaion() {
  //   emit(FeedUnLikAnimationStart());
  // }

  Future<void> deletePost(String postId) async {
    final FirebaseStorage fStorage = FirebaseStorage.instance;
    try {
      _firestore.collection('posts').doc(postId).delete();
      fStorage.ref().child('posts').child(postId).delete();
      emit(FeedDeletePost());
    } catch (e) {
      showSnackBar(e.toString(), isError: true);
    }
  }
}
