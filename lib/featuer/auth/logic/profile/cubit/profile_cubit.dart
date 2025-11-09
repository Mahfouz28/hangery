import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangery/featuer/auth/data/auth_model.dart';
import 'package:hangery/featuer/auth/data/auth_repo.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.authRepo) : super(ProfileInitial());

  final AuthRepo authRepo;

  String? pickedImagePath; // for new image upload
  String? localImagePath; // for showing selected image instantly
  bool imageRemoved = false; // track if user removed current image
  bool visaRemoved = false; // track if visa was removed

  /// -------------------- Get Profile -------------------
  Future<void> getProfileData() async {
    try {
      emit(ProfileLoading());
      final user = await authRepo.getProfilrData();
      imageRemoved = false;
      visaRemoved = false;
      emit(ProfileSuccess(userModel: user, messegr: 'Profile Data Success'));
      // Removed print statement as user['data'] is not valid for UserModel
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  Future<void> imagePicker() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        pickedImagePath = pickedFile.path;
        localImagePath = pickedFile.path;
        imageRemoved = false;
        emit(ProfileImagePicked(imagePath: pickedFile.path));
      } else {
        emit(ProfileImagePickingError(error: 'No image selected'));
      }
    } catch (e) {
      emit(ProfileImagePickingError(error: e.toString()));
    }
  }

  /// -------------------- Remove Profile Image -------------------
  void clearPickedImage() {
    pickedImagePath = null;
    localImagePath = null;
    imageRemoved = true;
    if (state is ProfileSuccess) {
      final user = (state as ProfileSuccess).userModel;
      final updatedUser = UserModel(
        name: user.name,
        email: user.email,
        address: user.address,
        token: user.token,
        visa: user.visa,
        image: null,
      );
      emit(
        ProfileSuccess(
          userModel: updatedUser,
          messegr: "Profile image removed",
        ),
      );
    } else {
      emit(ProfileImagePickingError(error: 'Profile not loaded'));
    }
  }

  /// -------------------- Remove Visa -------------------
  void clearVisa() {
    visaRemoved = true;
    if (state is ProfileSuccess) {
      final currentUserModel = (state as ProfileSuccess).userModel;
      final updatedUserModel = UserModel(
        name: currentUserModel.name,
        email: currentUserModel.email,
        address: currentUserModel.address,
        image: currentUserModel.image,
        token: currentUserModel.token,
        visa: null,
      );
      emit(
        ProfileSuccess(userModel: updatedUserModel, messegr: "Visa cleared"),
      );
    } else {
      emit(ProfileError(error: "Cannot clear visa: profile data not loaded."));
    }
  }

  /// -------------------- Update Profile -------------------
  Future<void> updateProfileData({
    required String name,
    required String email,
    required String address,
    String? visa,
    String? image,
  }) async {
    try {
      emit(ProfileUpdateLoading());

      // Handle removals and updates cleanly
      await authRepo.updateProfileData(
        name: name,
        email: email,
        address: address,
        visa: visaRemoved ? null : visa,
        image: imageRemoved ? null : pickedImagePath,
      );

      final updatedUser = await authRepo.getProfilrData();

      imageRemoved = false;
      visaRemoved = false;

      emit(ProfileUpdateSuccess(message: "Profile updated successfully"));
      emit(ProfileSuccess(userModel: updatedUser, messegr: "Profile Updated"));
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  /// -------------------- Logout -------------------
  Future<void> logout() async {
    try {
      await authRepo.logout();
      emit(ProfileInitial());
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
}
