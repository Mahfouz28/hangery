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

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              SnackbarHelper.showSuccess(context, state.message);

              context.pushNamedAndRemoveUntil(Routs.root);
            } else if (state is AuthError) {
              SnackbarHelper.showError(context, state.error);
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    60.verticalSpace,
                    SvgPicture.asset('assets/svg/Hungry_.svg', height: 120.h),
                    16.verticalSpace,
                    CoustomText(
                      text: 'Welcome Back ',
                      color: Colors.white,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    8.verticalSpace,
                    CoustomText(
                      text: 'Discover the fastest way to order your food',
                      color: Colors.white70,
                      fontSize: 14.sp,
                    ),
                    60.verticalSpace,

                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AppTextFeild(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              ).hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },

                            labelColor: Colors.white,
                            hintColor: Colors.grey,
                            controller: emailController,
                            labelText: 'Email',
                            hintText: 'example@email.com',
                            fillColor: Colors.transparent,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          22.verticalSpace,
                          AppTextFeild(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              // if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              //   return 'Password must contain at least one uppercase letter';
                              // }
                              // if (!RegExp(r'[0-9]').hasMatch(value)) {
                              //   return 'Password must contain at least one number';
                              // }
                              // if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                              //   return 'Password must include at least one special character (!, @, #, etc.)';
                              // }
                              return null;
                            },

                            labelColor: Colors.white,
                            hintColor: Colors.grey,
                            controller: passwordController,
                            labelText: 'Password',
                            hintText: '********',
                            fillColor: Colors.transparent,
                            obscureText: true,
                            suffixIcon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: CoustomText(
                                text: 'Forgot Password?',
                                color: Colors.white70,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          30.verticalSpace,
                          isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : CustomTextButton(
                                  backgroundColor: Colors.white,
                                  text: 'Login',
                                  textColor: AppColors.primaryColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }

                                    // if (formKey.currentState!.validate()) {
                                    //   context.read<AuthCubit>().login(
                                    //     email: emailController.text,
                                    //     password: passwordController.text,
                                    //   );
                                    // }
                                  },
                                ),
                          30.verticalSpace,
                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.white24)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: CoustomText(
                                  text: 'or',
                                  color: Colors.white70,
                                ),
                              ),
                              Expanded(child: Divider(color: Colors.white24)),
                            ],
                          ),
                          30.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CoustomText(
                                text: "Don't have an account? ",
                                color: Colors.white70,
                                fontSize: 15.sp,
                              ),
                              GestureDetector(
                                onTap: () => context.pushNamed(Routs.signUp),
                                child: CoustomText(
                                  text: 'Sign Up',
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
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
            );
          },
        ),
      ),
    );
  }
}
