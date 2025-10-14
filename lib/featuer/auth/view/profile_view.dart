import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/app_text_feild.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/core/utils/naivgators.dart';
import 'package:hangery/featuer/auth/widgets/pyment.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
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
              Container(
                height: 130.h,
                width: 130.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset('assets/images/11.jpeg', fit: BoxFit.cover),
              ),
              30.verticalSpace,
              AppTextFeild(
                labelText: 'Name',
                hintText: 'User Name',
                fillColor: Colors.white.withOpacity(0.12),
                labelColor: Colors.white,
                hintColor: Colors.white70,
              ),
              20.verticalSpace,
              AppTextFeild(
                labelText: 'Email',
                hintText: 'user@example.com',
                fillColor: Colors.white.withOpacity(0.12),
                labelColor: Colors.white,
                hintColor: Colors.white70,
              ),
              20.verticalSpace,
              AppTextFeild(
                labelText: 'Delivery Address',
                hintText: '55 Dubai, UAE',
                fillColor: Colors.white.withOpacity(0.12),
                labelColor: Colors.white,
                hintColor: Colors.white70,
              ),
              20.verticalSpace,
              AppTextFeild(
                labelText: 'Password',
                hintText: '*********',
                fillColor: Colors.white.withOpacity(0.12),
                labelColor: Colors.white,
                hintColor: Colors.white70,
                obscureText: true,
              ),
              35.verticalSpace,
              Payment(),
              30.verticalSpace,

              Row(
                children: [
                  Expanded(
                    child: CustomTextButton(
                      text: 'Edit Profile',
                      onPressed: () {},
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
                      onPressed: () {
                        context.pushReplacementNamed(Routs.loginView);
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
  }
}
