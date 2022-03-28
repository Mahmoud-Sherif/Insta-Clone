import 'package:chat_app/core/model/user.dart';
import 'package:chat_app/features/add_post/view.dart';
import 'package:chat_app/features/cubit/main_cubit.dart';

import 'package:chat_app/features/feed/view.dart';
import 'package:chat_app/features/profile/view.dart';
import 'package:chat_app/features/search/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit of(context) => BlocProvider.of(context);
  int bottomNavBarIndex = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //  String uId =  FirebaseAuth.instance.currentUser!.uid;

  List homeViews = [
    const FeedView(),
    const SearchView(),
    const AddPostView(),
    const SearchView(),
    ProfileView(uid: FirebaseAuth.instance.currentUser!.uid),
  ];

  // Future getUserData() async {
  //   User? curenUser = _auth.currentUser;
  //   await curenUser?.reload();
  //   curenUser = _auth.currentUser;
  //   final snap = await _firestore.collection('users').doc(curenUser!.uid).get();
  //   UserData _userData = UserData.fromJson(snap);
  //   return _userData;
  // }

  void navBarController(int value) {
    bottomNavBarIndex = value;

    emit(HomeBottomNavBarNavigation());
  }
}
