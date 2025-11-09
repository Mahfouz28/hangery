import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/utils/naivgators.dart';
import 'package:hangery/core/utils/pref_helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    checkLogin();
  }

  Future<void> checkLogin() async {
    final token = await PrefHelpers.getToken();
    await Future.delayed(const Duration(seconds: 2)); // splash delay

    if (token != null && token.isNotEmpty) {
      context.pushReplacementNamed(Routs.root);
    } else {
      context.pushReplacementNamed(Routs.loginView);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                290.verticalSpace,
                SvgPicture.asset('assets/svg/Hungry_.svg', height: 55.h),
                const Spacer(),
                Image.asset('assets/images/splashImage.png', height: 250.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
