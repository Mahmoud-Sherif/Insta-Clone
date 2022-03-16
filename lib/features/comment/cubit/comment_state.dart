part of 'comment_cubit.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentFetchDataFinshed extends CommentState {}
