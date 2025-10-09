import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/app_text_feild.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/core/utils/naivgators.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              150.verticalSpace,
              SvgPicture.asset('assets/svg/Hungry_.svg'),
              8.verticalSpace,
              CoustomText(
                text: 'Welcom Back , descover the fast food',
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
                    40.verticalSpace,
                    CustomTextBotton(
                      backGroundColor: Colors.white,
                      text: 'Login',
                      color: AppColors.primaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('Login button pressed');
                          context.pushNamedAndRemoveUntil(Routs.root);
                        }
                      },
                    ),
                    22.verticalSpace,
                    TextButton(
                      onPressed: () {
                        context.pushNamed(Routs.signUp);
                      },
                      child: CoustomText(
                        text: 'Create new account',
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
