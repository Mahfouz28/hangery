import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';

class ToppingCard extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onAdd;

  const ToppingCard({
    super.key,
    required this.name,
    required this.image,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 97.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: const Color(0xff3C2F2F),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 75.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CoustomText(
                  text: name,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 25.w,
                  height: 25.h,
                  child: IconButton.filled(
                    onPressed: onAdd,
                    icon: Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.redAccent,
                      ),
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
