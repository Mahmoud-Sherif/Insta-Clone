part of 'feed_cubit.dart';

@immutable
abstract class FeedState {}

class FeedInitial extends FeedState {}

class Feedloading extends FeedState {}
class FeedFinshedloading extends FeedState {}


class FeedLikAnimationStart extends FeedState {}
class FeedUnLikAnimationStart extends FeedState {}


class FeedLikUpdate extends FeedState {}

class FeedDeletePost extends FeedState {}
class FeedCommentFinshed extends FeedState {}






