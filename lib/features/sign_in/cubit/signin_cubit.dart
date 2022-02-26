import 'package:bloc/bloc.dart';
import 'package:chat_app/core/routes/magic_router.dart';
import 'package:chat_app/features/home/view.dart';
import 'package:chat_app/widgets/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  static SigninCubit of(context) => BlocProvider.of(context);

  late String email;
  late String password;
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(SigninLoading());
      try {
        final cred = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        MagicRouter.navigateAndPopAll(const HomeView());
        } on FirebaseAuthException catch (e) {
          showSnackBar(e.toString(), isError: true);
      } catch (e) {
        showSnackBar(e.toString(), isError: true);
      }
      emit(SigninInitial());
    }
  }
}
