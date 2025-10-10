import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/featuer/prouduct_details/view/widgets/spicy_slider.dart';

class CustomizeUrOrder extends StatelessWidget {
  const CustomizeUrOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 170.w,
          height: 297.h,
          child: Image.asset('assets/images/prouduct_details_image.png'),
        ),
        20.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customize',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
              ),

              Text(
                'Your Burger to Your Tastes. Ultimate Experience',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
                softWrap: true,
              ),
              20.verticalSpace,
              SpicySlider(),
            ],
          ),
        ),
      ],
    );
  }
}
