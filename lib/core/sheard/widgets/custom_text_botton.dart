import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;

  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.height,
    this.width,
    this.borderColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius = 20,
    this.borderWidth = 2,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth.w,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 16.sp,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
