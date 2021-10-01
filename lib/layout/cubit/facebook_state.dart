part of 'facebook_cubit.dart';

@immutable
abstract class FacebookState {}

class FacebookInitial extends FacebookState {}

class GetDataLoading extends FacebookState {}

class GetDataSuccess extends FacebookState {}

class ChangeLikeButton extends FacebookState {}
