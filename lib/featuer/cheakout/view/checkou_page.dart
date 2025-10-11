import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';
import 'package:hangery/featuer/cheakout/widgets/order_summry.dart';
import 'package:hangery/featuer/cheakout/widgets/pay.dart';
import 'package:hangery/featuer/cheakout/widgets/payment_methodes.dart';

class CheckouPage extends StatelessWidget {
  const CheckouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, size: 28.sp),
              ),
              20.verticalSpace,
              const OrderSummry(),
              70.verticalSpace,
              CoustomText(
                color: const Color(0xff3C2F2F),
                text: 'Payment methods',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              20.verticalSpace,
              PaymentMethodes(),
              Spacer(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 140.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.h),
          child: const Pay(),
        ),
      ),
    );
  }
}
