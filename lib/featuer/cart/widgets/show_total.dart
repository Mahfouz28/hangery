import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';

class ShowTotal extends StatelessWidget {
  final Widget totalAmount;
  final VoidCallback? onCheckout;
  final String currencySymbol;
  final String text;
  final bool isDeleting;

  const ShowTotal({
    super.key,
    required this.totalAmount,
    this.onCheckout,
    this.currencySymbol = '\$',
    required this.text,
    required this.isDeleting, // default currency
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              5.verticalSpace,
              totalAmount,
            ],
          ),
          const Spacer(),

          isDeleting
              ? CircularProgressIndicator(strokeWidth: 2, color: Colors.black)
              : CustomTextButton(
                  height: 60.h,
                  width: 170.w,
                  textColor: Colors.white,
                  onPressed: onCheckout,
                  text: text,
                  backgroundColor: AppColors.primaryColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                ),
        ],
      ),
    );
  }
}
