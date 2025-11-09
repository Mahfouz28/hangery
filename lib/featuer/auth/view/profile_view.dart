import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/network/api_services.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/app_text_feild.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/core/utils/auth_manger.dart';
import 'package:hangery/core/utils/naivgators.dart';
import 'package:hangery/core/utils/snacbar_helper.dart';
import 'package:hangery/featuer/auth/data/auth_repo.dart';
import 'package:hangery/featuer/auth/logic/profile/cubit/profile_cubit.dart';
import 'package:hangery/featuer/auth/widgets/profile_guset.dart';
import 'package:hangery/featuer/auth/widgets/pyment.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController visaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (!AuthManager.isLoggedIn) {
      return GuestProfile();
    }
    return BlocProvider(
      create: (context) =>
          ProfileCubit(AuthRepo(ApiServices()))..getProfileData(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileError) {}

              if (state is ProfileImagePickingError) {
                SnackbarHelper.showError(context, state.error);
              }

              if (state is ProfileSuccess) {
                nameController.text = state.userModel.name;
                emailController.text = state.userModel.email;
                addressController.text = state.userModel.address ?? '';
                visaController.text = state.userModel.visa?.toString() ?? '';
              }

              if (state is ProfileUpdateSuccess) {
                SnackbarHelper.showSuccess(context, state.message);
              }
            },
            builder: (context, state) {
              final cubit = context.read<ProfileCubit>();

              final profile = state is ProfileSuccess ? state.userModel : null;

              final isLoading =
                  state is ProfileLoading || state is ProfileUpdateLoading;

              return RefreshIndicator(
                color: AppColors.primaryColor,
                onRefresh: () async => cubit.getProfileData(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  child: Skeletonizer(
                    enabled: isLoading,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                                size: 22.sp,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings_outlined,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,

                        GestureDetector(
                          onTap: isLoading
                              ? null
                              : () async {
                                  await cubit.imagePicker();
                                },
                          child: Stack(
                            children: [
                              Container(
                                height: 130.h,
                                width: 130.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4.w,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Builder(
                                  builder: (context) {
                                    if (cubit.imageRemoved) {
                                      return const Icon(
                                        Icons.person,
                                        size: 80,
                                        color: Colors.white,
                                      );
                                    }

                                    if (cubit.pickedImagePath != null) {
                                      return Image.file(
                                        File(cubit.pickedImagePath!),
                                        fit: BoxFit.cover,
                                      );
                                    }
                                    if (profile?.image != null &&
                                        profile!.image!.isNotEmpty) {
                                      return Image.network(
                                        profile.image!,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return const Icon(
                                                Icons.person,
                                                size: 80,
                                                color: Colors.white,
                                              );
                                            },
                                      );
                                    }
                                    return const Icon(
                                      Icons.person,
                                      size: 80,
                                      color: Colors.white,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          profile?.name ?? 'Your Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          profile?.email ?? 'your.email@example.com',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.sp,
                          ),
                        ),

                        30.verticalSpace,

                        AppTextFeild(
                          controller: nameController,
                          enabled: !isLoading,
                          labelText: 'User Name',
                          hintText: profile?.name ?? '',
                          fillColor: Colors.white.withOpacity(0.12),
                          labelColor: Colors.white,
                          hintColor: Colors.white70,
                        ),
                        20.verticalSpace,

                        AppTextFeild(
                          controller: emailController,
                          enabled: !isLoading,
                          labelText: 'Email',
                          hintText: profile?.email ?? '',
                          fillColor: Colors.white.withOpacity(0.12),
                          labelColor: Colors.white,
                          hintColor: Colors.white70,
                        ),
                        20.verticalSpace,

                        AppTextFeild(
                          controller: addressController,
                          enabled: !isLoading,
                          labelText: 'Address',
                          hintText: profile?.address ?? 'Add your Address',
                          fillColor: Colors.white.withOpacity(0.12),
                          labelColor: Colors.white,
                          hintColor: Colors.white70,
                        ),
                        20.verticalSpace,

                        (profile?.visa == null ||
                                profile!.visa!.toString().isEmpty)
                            ? AppTextFeild(
                                controller: visaController,
                                enabled: !isLoading,
                                labelText: 'Visa',
                                hintText: 'Add your visa',
                                fillColor: Colors.white.withOpacity(0.12),
                                labelColor: Colors.white,
                                hintColor: Colors.white70,
                              )
                            : Payment(
                                text:
                                    profile.visa?.toString() ??
                                    '**** **** **** 1234',
                              ),

                        40.verticalSpace,

                        Row(
                          children: [
                            Expanded(
                              child: CustomTextButton(
                                text: isLoading ? 'Saving...' : 'Save Changes',
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        cubit.updateProfileData(
                                          name: nameController.text.isNotEmpty
                                              ? nameController.text
                                              : profile?.name ?? '',
                                          email: emailController.text.isNotEmpty
                                              ? emailController.text
                                              : profile?.email ?? '',
                                          address:
                                              addressController.text.isNotEmpty
                                              ? addressController.text
                                              : profile?.address ?? '',
                                          visa: visaController.text.isNotEmpty
                                              ? visaController.text
                                              : profile?.visa,
                                          image: cubit.pickedImagePath,
                                        );
                                      },
                                height: 65.h,
                                textColor: AppColors.primaryColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                backgroundColor: Colors.white,
                                borderRadius: 14.r,
                              ),
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: CustomTextButton(
                                text: 'Log Out',
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        cubit.logout();
                                        context.pushReplacementNamed(
                                          Routs.loginView,
                                        );
                                      },
                                height: 65.h,
                                textColor: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                backgroundColor: Colors.transparent,
                                borderColor: Colors.white,
                                borderRadius: 14.r,
                              ),
                            ),
                          ],
                        ),
                        25.verticalSpace,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
