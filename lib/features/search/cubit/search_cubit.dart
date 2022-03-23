import 'package:bloc/bloc.dart';
import 'package:chat_app/core/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit of(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  List<UserData> searchedUser = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> getAllUser(String username) async {
    final _fireStore = FirebaseFirestore.instance;
    final user = await _fireStore
        .collection('users')
        .where(username, isGreaterThanOrEqualTo: searchController.text)
        .get();

    print(user.docs);

    // searchedUser.add(UserData.fromJson(user));
  }
}
