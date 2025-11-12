import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';

class OrderSummry extends StatelessWidget {
  final double totalPrice;
  final double deliveryFee;
  final double taxes;
  final double total;

  const OrderSummry({
    super.key,
    required this.totalPrice,
    required this.deliveryFee,
    required this.taxes,
    required this.total,
  });

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
            color: Colors.white,
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
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    CoustomText(
                      text: '\$ $totalPrice EGP',
                      color: Colors.white,

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
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    CoustomText(
                      text: taxes.toString(),
                      color: Colors.white,

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
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    CoustomText(
                      text: deliveryFee.toString(),
                      color: Colors.white,

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
                color: Colors.white,
              ),
              Spacer(),
              CoustomText(
                text: '\$ $total EGP',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
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
                color: Colors.white,
              ),
              Spacer(),
              CoustomText(
                text: '20-30 min',
                color: Colors.white,
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
