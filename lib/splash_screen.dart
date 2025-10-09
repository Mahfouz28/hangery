import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangery/core/constant/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          290.verticalSpace,
          SvgPicture.asset('assets/svg/Hungry_.svg'),
          Spacer(),
          Image.asset('assets/images/splashImage.png'),
        ],
      ),
    );
  }
}
