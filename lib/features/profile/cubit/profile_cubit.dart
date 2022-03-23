import 'package:chat_app/core/model/post.dart';
import 'package:chat_app/widgets/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit of(context) => BlocProvider.of(context);
  List<Post> userPost = [];

  getUserPosts() async {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final uid = _auth.currentUser!.uid;
    try {
      _fireStore
          .collection('posts')
          .where('uid', isEqualTo: uid)
          .snapshots()
          .listen((event) {
        emit(ProfiUserPostsLoadding());
        userPost = [];
        event.docs.forEach((element) {
          userPost.add(Post.fromJson(element.data()));

          emit(ProfiUserPostsFinshed());
        });
      });
    } catch (e) {
      showSnackBar(e.toString(), isError: true);
    }
  }
}
