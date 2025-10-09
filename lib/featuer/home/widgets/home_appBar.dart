import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/svg/Hungry_.svg',
              height: 46.h,
              width: 216.w,
              color: AppColors.primaryColor,
            ),
            CoustomText(
              text: 'Hello , Mahfouz',
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 35.r,
          child: SvgPicture.asset(
            'assets/svg/spiderman-logo.svg',
            height: 60.h,
            width: 60.w,
          ),
        ),
      ],
    );
  }
}
