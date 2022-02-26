part of 'addpost_cubit.dart';

@immutable
abstract class AddpostState {}

class AddpostInitial extends AddpostState {}

class AddpostImage extends AddpostState {}
class AddpostImageFinshed extends AddpostState {}
class AddpostLoading extends AddpostState {}
class AddpostFished extends AddpostState {}




