import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';

class Pay extends StatelessWidget {
  final double totalPayPrice;
  final VoidCallback? onPayButtonPressed;

  const Pay({super.key, required this.totalPayPrice, this.onPayButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            30.verticalSpace,
            Text(
              'Total price',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
              ),
            ),

            Text(
              '${totalPayPrice.toStringAsFixed(2)} EGP',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Spacer(),
        CustomTextButton(
          height: 70.h,
          width: 200.w,
          textColor: Colors.white,
          onPressed: () {
            if (onPayButtonPressed != null) {
              onPayButtonPressed!();
            }
          },
          text: 'Pay Now',
          backgroundColor: AppColors.primaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
