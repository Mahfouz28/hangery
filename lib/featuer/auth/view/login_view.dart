import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/app_text_feild.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/core/utils/naivgators.dart';

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
        child: SingleChildScrollView(
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
                  fontWeight: FontWeight.w400,
                ),

                60.verticalSpace,

                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextFeild(
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

                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your email';
                        //   }
                        //   if (!value.contains('@')) {
                        //     return 'Enter a valid email';
                        //   }
                        //   return null;
                        // },
                      ),
                      22.verticalSpace,

                      AppTextFeild(
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
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your password';
                        //   }
                        //   if (value.length < 6) {
                        //     return 'Password must be at least 6 characters';
                        //   }
                        //   return null;
                        // },
                      ),

                      /// Forgot Password
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

                      CustomTextButton(
                        backgroundColor: Colors.white,
                        text: 'Login',
                        textColor: AppColors.primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.pushNamedAndRemoveUntil(Routs.root);
                          }
                        },
                      ),

                      30.verticalSpace,

                      /// Divider or "Or" line
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: Colors.white24, thickness: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: CoustomText(
                              text: 'or',
                              color: Colors.white70,
                            ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.white24, thickness: 1),
                          ),
                        ],
                      ),

                      30.verticalSpace,

                      /// 👤 Create Account
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
        ),
      ),
    );
  }
}
