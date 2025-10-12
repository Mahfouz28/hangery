import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/app_text_feild.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/core/utils/naivgators.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  60.verticalSpace,
                  SvgPicture.asset('assets/svg/Hungry_.svg', height: 100.h),
                  16.verticalSpace,
                  CoustomText(
                    text: 'Create Account, discover fast food!',
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  60.verticalSpace,

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextFeild(
                          controller: nameController,
                          suffixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                          ),
                          fillColor: Colors.transparent,
                          labelText: 'Name',
                          labelColor: Colors.white,
                          hintText: 'Your name',
                          hintColor: Colors.white70,
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
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          fillColor: Colors.transparent,
                          labelText: 'Email',
                          labelColor: Colors.white,
                          hintText: 'example@email.com',
                          hintColor: Colors.white70,
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
                          suffixIcon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.white,
                          ),
                          fillColor: Colors.transparent,
                          labelText: 'Password',
                          labelColor: Colors.white,
                          hintText: '***********',
                          hintColor: Colors.white70,
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
                          suffixIcon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.white,
                          ),
                          fillColor: Colors.transparent,
                          labelText: 'Confirm Password',
                          labelColor: Colors.white,
                          hintText: '***********',
                          hintColor: Colors.white70,
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

                        CustomTextButton(
                          text: 'Create Account',
                          backgroundColor: Colors.white,
                          textColor: AppColors.primaryColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('Create Account button pressed');
                            }
                          },
                        ),

                        20.verticalSpace,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CoustomText(
                              text: 'Already have an account?',
                              color: Colors.white70,
                              fontSize: 14.sp,
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushReplacementNamed(Routs.loginView);
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
