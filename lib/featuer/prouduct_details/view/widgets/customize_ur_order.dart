import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/spicy_slider.dart';

class CustomizeUrOrder extends StatelessWidget {
  const CustomizeUrOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18.r),
          child: Image.asset(
            'assets/images/prouduct_details_image.png',
            width: 140.w,
            height: 180.h,
          ),
        ),

        18.horizontalSpace,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customize Your Order',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              6.verticalSpace,
              Text(
                'Make your burger truly yours  choose your spice level and enjoy the perfect taste.',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.white,
                  height: 1.4,
                ),
              ),
              20.verticalSpace,

              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor.withOpacity(0.1),
                      Colors.white.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: const SpicySlider(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
