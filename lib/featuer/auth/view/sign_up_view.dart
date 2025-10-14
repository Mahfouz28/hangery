import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/app_text_feild.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/core/utils/naivgators.dart';
import 'package:hangery/core/utils/snacbar_helper.dart';
import 'package:hangery/featuer/auth/logic/auth_cubit.dart';

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  SnackbarHelper.showError(context, state.error);
                } else if (state is AuthSuccess) {
                  SnackbarHelper.showSuccess(context, state.message);
                  nameController.clear();
                  emailController.clear();
                  passwordController.clear();
                  confirmPasswordController.clear();
                  context.pushNamedAndRemoveUntil(Routs.loginView);
                }
              },
              builder: (context, state) {
                bool isLoading = state is AuthLoading;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    50.verticalSpace,
                    SvgPicture.asset('assets/svg/Hungry_.svg', height: 110.h),
                    16.verticalSpace,
                    CoustomText(
                      text: 'Create Account, discover fast food!',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                    50.verticalSpace,

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
                              if (value.length < 3) {
                                return 'Name must be at least 3 characters';
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
                              final emailRegex = RegExp(
                                r'^[^@]+@[^@]+\.[^@]+$',
                              );
                              if (!emailRegex.hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          22.verticalSpace,
                          AppTextFeild(
                            controller: passwordController,
                            suffixIcon: const Icon(
                              Icons.lock_outline,
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
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          22.verticalSpace,
                          AppTextFeild(
                            controller: confirmPasswordController,
                            suffixIcon: const Icon(
                              Icons.lock_outline,
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

                          isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : CustomTextButton(
                                  text: 'Create Account',
                                  backgroundColor: Colors.white,
                                  textColor: AppColors.primaryColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().register(
                                        name: nameController.text.trim(),
                                        email: emailController.text.trim(),
                                        password: passwordController.text
                                            .trim(),
                                      );
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
                                onPressed: () => context.pushReplacementNamed(
                                  Routs.loginView,
                                ),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
