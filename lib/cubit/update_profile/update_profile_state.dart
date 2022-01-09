part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState{}

class UpdateProfileSuccess extends UpdateProfileState{
  final ResUpdateProfile? resUpdateProfile;
  UpdateProfileSuccess(this.resUpdateProfile);
}

class UpdateProfileError extends UpdateProfileState{
  final String? message;
  UpdateProfileError(this.message);
}