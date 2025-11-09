import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/app_text_feild.dart';
import 'package:hangery/core/utils/naivgators.dart';

class GuestProfile extends StatelessWidget {
  const GuestProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E1E2C), Color(0xFF2D2F48)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                // Back button
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
                  ],
                ),
                30.verticalSpace,

                // Avatar with glow
                Container(
                  height: 120.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ],
                    border: Border.all(color: Colors.white70, width: 3.w),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: Colors.white,
                    size: 70,
                  ),
                ),

                20.verticalSpace,
                Text(
                  'Guest User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
                6.verticalSpace,
                Text(
                  'guest@hangery.com',
                  style: TextStyle(color: Colors.white70, fontSize: 15.sp),
                ),

                40.verticalSpace,

                // Profile info card
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.white24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AppTextFeild(
                        controller: TextEditingController(text: 'Guest User'),
                        enabled: false,
                        labelText: 'User Name',
                        fillColor: Colors.white.withOpacity(0.07),
                        labelColor: Colors.white,
                        hintColor: Colors.white70,
                      ),
                      18.verticalSpace,
                      AppTextFeild(
                        controller: TextEditingController(
                          text: 'guest@hangery.com',
                        ),
                        enabled: false,
                        labelText: 'Email',
                        fillColor: Colors.white.withOpacity(0.07),
                        labelColor: Colors.white,
                        hintColor: Colors.white70,
                      ),
                      18.verticalSpace,
                      AppTextFeild(
                        controller: TextEditingController(
                          text: 'No Address Added',
                        ),
                        enabled: false,
                        labelText: 'Address',
                        fillColor: Colors.white.withOpacity(0.07),
                        labelColor: Colors.white,
                        hintColor: Colors.white70,
                      ),
                    ],
                  ),
                ),

                40.verticalSpace,

                // Gradient button
                GestureDetector(
                  onTap: () => context.pushReplacementNamed(Routs.loginView),
                  child: Container(
                    height: 60.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor,
                          AppColors.primaryColor.withOpacity(0.8),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Login to Your Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                25.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
