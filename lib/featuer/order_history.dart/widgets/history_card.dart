import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    'assets/images/Cheeseburger.png',
                    width: 90.w,
                    height: 90.h,
                    fit: BoxFit.cover,
                  ),
                ),
                20.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cheeseburger',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      'Qty: x3',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      'Total: \$25.00',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            20.verticalSpace,
            CustomTextButton(
              height: 50.h,
              width: double.infinity,
              text: 'Order Again',
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
