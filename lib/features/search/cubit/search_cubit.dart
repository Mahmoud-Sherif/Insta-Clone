import 'package:bloc/bloc.dart';
import 'package:chat_app/core/model/user.dart';
import 'package:chat_app/widgets/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit of(context) => BlocProvider.of(context);
  // TextEditingController searchController = TextEditingController();
  List<UserData> searchedUser = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String text;
  // late String searchInbut;

  Future<void> getSearchedlUser() async {
    emit(SearchUserDataLoading());
    final _fireStore = FirebaseFirestore.instance;
    formKey.currentState!.save();
    try {
      await _fireStore
          .collection('users')
          .where('username', isGreaterThanOrEqualTo: text)
          .get()
          .then((value) {
        searchedUser = [];
        for (var element in value.docs) {
          searchedUser.add(UserData.fromJson(element));
        }
      });
    } catch (e) {
      showSnackBar(e.toString(), isError: true);
    }

    emit(SearchUserDataFinshed());
  }
}
