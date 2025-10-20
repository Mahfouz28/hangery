part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileUpdateLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserModel userModel;
  final String messegr;
  ProfileSuccess({required this.userModel, required this.messegr});
}

class ProfileUpdateSuccess extends ProfileState {
  final String message;
  ProfileUpdateSuccess({required this.message});
}

class ProfileError extends ProfileState {
  final String error;
  ProfileError({required this.error});
}

class ProfileImagePicked extends ProfileState {
  final String imagePath;
  ProfileImagePicked({required this.imagePath});
}

class ProfileImagePickingError extends ProfileState {
  final String error;
  ProfileImagePickingError({required this.error});
}
