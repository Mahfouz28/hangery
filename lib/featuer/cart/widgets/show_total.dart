import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/routing/routs.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';
import 'package:hangery/core/utils/naivgators.dart';

class ShowTotal extends StatelessWidget {
  const ShowTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              'Total',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),

            Text(
              '\$25.99',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const Spacer(),
        CustomTextBotton(
          height: 70.h,
          width: 200.w,
          color: Colors.white,
          onPressed: () {
            context.pushNamed(Routs.checkout);
          },
          text: 'Checkout',
          backGroundColor: AppColors.primaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
