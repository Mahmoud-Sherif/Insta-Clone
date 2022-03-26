part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchUserDataLoading extends SearchState {}

class SearchUserDataFinshed extends SearchState {}
