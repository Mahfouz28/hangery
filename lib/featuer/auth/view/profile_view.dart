import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/app_text_feild.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Colors.white),
                  ),
                ],
              ),
              20.verticalSpace,
              Container(
                height: 130.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.white, width: 4.w),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset('assets/images/11.jpeg', fit: BoxFit.cover),
              ),
              20.verticalSpace,
              AppTextFeild(
                labelText: 'Name',
                hintText: 'User Name',
                fillColor: Colors.transparent,
              ),
              20.verticalSpace,
              AppTextFeild(
                labelText: 'Email',
                hintText: 'user@example.com',
                fillColor: Colors.transparent,
              ),
              20.verticalSpace,
              AppTextFeild(
                labelText: 'Delivery address ',
                hintText: '55Dubai, UAE',
                fillColor: Colors.transparent,
              ),
              20.verticalSpace,
              AppTextFeild(
                labelText: 'Password',
                hintText: '*********',
                fillColor: Colors.transparent,
              ),
              Spacer(),
              Row(
                children: [
                  CustomTextButton(
                    text: 'Edite Profile',
                    onPressed: () {},
                    width: 195.w,
                    height: 70.h,
                    textColor: AppColors.primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    backgroundColor: Colors.white,
                  ),
                  10.horizontalSpace,
                  CustomTextButton(
                    text: 'Log out',
                    onPressed: () {},
                    width: 195.w,
                    height: 70.h,
                    textColor: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    backgroundColor: AppColors.primaryColor,
                    borderColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
