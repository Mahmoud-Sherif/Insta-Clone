import 'package:bloc/bloc.dart';
import 'package:chat_app/features/home/cubit/home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/model/user.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit of(context) => BlocProvider.of(context);
// fire base data
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserData userData;
  Future getUserData() async {
    emit(MainLoadingUserData());
    User? curenUser = _auth.currentUser;
    await curenUser?.reload();
    curenUser = _auth.currentUser;
    final snap = await _firestore.collection('users').doc(curenUser!.uid).get();
    userData = UserData.fromJson(snap);
    emit(MainInitial());
  }

  Future getUserDataa() async {
    emit(MainLoadingUserData());
    User? curenUser = _auth.currentUser;
    await curenUser?.reload();
    curenUser = _auth.currentUser;
    final snap = await _firestore
        .collection('users')
        .doc(curenUser!.uid)
        .snapshots()
        .listen((event) {
      userData = UserData.fromJson(event);
      emit(MainInitial());
    });
    // userData = UserData.fromJson(snap);
    // emit(MainInitial());
  }
}
