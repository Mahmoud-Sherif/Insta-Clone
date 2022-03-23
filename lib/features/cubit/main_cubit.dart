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
  late String uId;

  getUserDataa() async {
    emit(MainLoadingUserData());
    User? curenUser = _auth.currentUser;
     uId = curenUser!.uid;
    await curenUser.reload();
    _firestore.collection('users').doc(curenUser.uid).snapshots().listen(
      (event) {
        userData = UserData.fromJson(event);
        emit(MainInitial());
      },
    );
  }
}
