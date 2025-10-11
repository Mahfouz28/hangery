import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.0.r, vertical: 13.r),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/Cheeseburger.png',
                  width: 100,
                  height: 100,
                ),
                30.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cheese Burger',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Qyt: X3',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Total: \$25.00',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            20.verticalSpace,
            CustomTextBotton(
              text: 'Order Again',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,

              onPressed: () {},
              backGroundColor: Colors.grey,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
