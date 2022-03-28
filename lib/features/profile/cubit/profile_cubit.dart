import 'package:chat_app/core/model/post.dart';
import 'package:chat_app/core/model/user.dart';
import 'package:chat_app/core/routes/magic_router.dart';
import 'package:chat_app/features/sign_in/view.dart';
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
  late UserData userData;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  getUserPosts(String uid) async {
    try {
      final snap = await _fireStore.collection('users').doc(uid).get();
      userData = UserData.fromJson(snap);
      _fireStore
          .collection('posts')
          .where('uid', isEqualTo: uid)
          .snapshots()
          .listen((event) {
        emit(ProfileUserPostsLoadding());
        userPost = [];
        for (var element in event.docs) {
          userPost.add(Post.fromJson(element.data()));
          emit(ProfileUserPostsFinshed());
        }
      });
    } catch (e) {
      showSnackBar(e.toString(), isError: true);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    MagicRouter.navigateAndPopAll(const SignInView());
  }
}
