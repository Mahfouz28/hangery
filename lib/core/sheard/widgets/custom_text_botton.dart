import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextBotton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Color? color;
  final Color? backGroundColor;

  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomTextBotton({
    super.key,
    this.text,
    this.onPressed,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.sp,
      width: double.infinity,

      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text ?? '',
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
