import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/app_text_feild.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                150.verticalSpace,
                SvgPicture.asset('assets/svg/Hungry_.svg'),
                8.verticalSpace,
                CoustomText(
                  text: 'Create Account , descover the fast food',
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                90.verticalSpace,
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFeild(
                        controller: nameController,
                        suffixIcon: Icon(Icons.person_outline),
                        fillColor: Colors.white,
                        labelText: 'Name',
                        hintText: 'Your name',
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      22.verticalSpace,
                      AppTextFeild(
                        controller: emailController,
                        suffixIcon: Icon(Icons.email_outlined),

                        fillColor: Colors.white,
                        labelText: 'Email',
                        hintText: 'exampil@.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      22.verticalSpace,
                      AppTextFeild(
                        controller: passwordController,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),

                        fillColor: Colors.white,
                        labelText: 'Password',
                        hintText: '***********',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      22.verticalSpace,
                      AppTextFeild(
                        controller: confirmPasswordController,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),

                        fillColor: Colors.white,
                        labelText: 'Confirm Password',
                        hintText: '***********',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),

                      40.verticalSpace,
                      CustomTextBotton(
                        backGroundColor: Colors.white,
                        text: 'Create Account',
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('Login button pressed');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
