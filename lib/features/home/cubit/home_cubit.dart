import 'package:chat_app/core/model/user.dart';
import 'package:chat_app/features/add_post/view.dart';
import 'package:chat_app/features/feed/view.dart';
import 'package:chat_app/features/search/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit of(context) => BlocProvider.of(context);
// fire base data
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // late UserData userData;
// bootm nav control
  int bottomNavBarIndex = 0;
  List homeViews = [
    const FeedView(),
    const SearchView(),
    const AddPostView(),
    const SearchView(),
    const FeedView(),
  ];

  // Future getUserData() async {
  //   emit(HomeLoadUserData());
  //   User? curenUser = _auth.currentUser;
  //   await curenUser?.reload();
  //   curenUser = _auth.currentUser;
  //   final snap = await _firestore.collection('users').doc(curenUser!.uid).get();
  //   userData = UserData.fromJson(snap);
  //   emit(HomeInitial());
  // }

  void navBarController(int value) {
    bottomNavBarIndex = value;
    emit(HomeBottomNavBarNavigation());
  }
}
