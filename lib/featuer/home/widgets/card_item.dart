import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';

class CardItem extends StatefulWidget {
  const CardItem({super.key});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: 175.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset(
                    'assets/images/Cheeseburger.png',
                    height: 120.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              8.verticalSpace,
              CoustomText(
                text: 'Cheeseburger',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              CoustomText(
                text: 'Wendy\'s Burger',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Icon(Icons.star, size: 18.sp, color: Colors.amber),
                  5.horizontalSpace,
                  CoustomText(
                    text: '4.5',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => setState(() => isFavorite = !isFavorite),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                      child: Icon(
                        key: ValueKey(isFavorite),
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? AppColors.primaryColor
                            : Colors.grey[400],
                        size: 22.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
