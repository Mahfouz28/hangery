import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';

class OrderSummry extends StatelessWidget {
  const OrderSummry({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoustomText(
            text: 'Order summary',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              children: [
                Row(
                  children: [
                    CoustomText(
                      text: 'Total',
                      color: Colors.grey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    CoustomText(
                      text: '\$ 20.00',
                      color: Colors.grey,

                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    CoustomText(
                      text: 'Taxes',
                      color: Colors.grey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    CoustomText(
                      text: '\$ .04',
                      color: Colors.grey,

                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                10.verticalSpace,

                Row(
                  children: [
                    CoustomText(
                      text: 'Delivery fees',
                      color: Colors.grey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    CoustomText(
                      text: '\$ 1.5',
                      color: Colors.grey,

                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade300),
          24.verticalSpace,
          Row(
            children: [
              CoustomText(
                text: 'Total: ',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              CoustomText(
                text: '\$ 21.54',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              CoustomText(
                text: 'Estimated delivery time:',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              CoustomText(
                text: '20-30 min',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
