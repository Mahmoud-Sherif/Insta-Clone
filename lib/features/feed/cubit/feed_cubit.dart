import 'dart:async';

import 'package:chat_app/core/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    _firestore.collection('posts').get().then(
          (querySnapshot) => {
            querySnapshot.docs.forEach(
              (element) {
                Post _post = Post.fromJson(element.data());
                post.add(_post);
                print(post[0].caption);
              },
            )
          },
        );
    Timer(const Duration(seconds: 2), () => emit(FeedInitial()));
  }
}
