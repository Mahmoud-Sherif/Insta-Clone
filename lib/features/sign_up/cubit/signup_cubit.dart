import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/model/user.dart' as model;
import 'package:chat_app/core/routes/magic_router.dart';
import 'package:chat_app/features/home/view.dart';
import 'package:chat_app/widgets/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit of(context) => BlocProvider.of(context);

  late String name;
  late String bio;
  late String email;
  late String password;
  final formKey = GlobalKey<FormState>();
  Uint8List? file;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late model.UserData user;

  Future<void> signUP() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(SignupLoading());
      try {
        final cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String imageUrl = await uploadProfilePic();
        user = model.UserData(
            email: email,
            uid: cred.user!.uid,
            imageUrl: imageUrl,
            username: name,
            bio: bio,
            followers: [],
            following: []);

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        MagicRouter.navigateAndPopAll(const HomeView());
      } on FirebaseAuthException catch (e) {
        showSnackBar(e.toString(), isError: true);
      } catch (e) {
        showSnackBar(e.toString(), isError: true);
      }
      emit(SignupInitial());
    }
  }

  Future selectImage() async {
    final ImagePicker imgPicker = ImagePicker();
    try {
      XFile? _file = await imgPicker.pickImage(source: ImageSource.gallery);

      if (_file != null) {
        file = await _file.readAsBytes();
        emit(SignupImageLoaded());
      }
    } catch (e) {
      showSnackBar(e.toString(), isError: true);
    }
  }

  Future<String> uploadProfilePic() async {
    final FirebaseStorage fStorage = FirebaseStorage.instance;
    final ref =
        fStorage.ref().child('profilePics').child(_auth.currentUser!.uid);
    final uploadTask = ref.putData(file!);
    final snap = await uploadTask;
    final downlaodUrl = await snap.ref.getDownloadURL();
    return downlaodUrl;
  }
}
