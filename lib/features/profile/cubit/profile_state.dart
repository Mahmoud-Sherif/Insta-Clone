part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileUserPostsFinshed extends ProfileState {}

class ProfileUserPostsLoadding extends ProfileState {}

class ProfileUserDataFinshed extends ProfileState {}
