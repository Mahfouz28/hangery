import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/custom_text_botton.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
      child: Padding(
        padding: EdgeInsets.all(14.0.r),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                'assets/images/Cheeseburger.png',
                height: 80.h,
                width: 80.w,
                fit: BoxFit.cover,
              ),
            ),
            14.horizontalSpace,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cheeseburger',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    'Juicy beef, cheddar cheese, and soft buns.',
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  10.verticalSpace,
                  Text(
                    '\$5.99',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildIconButton(
                      icon: Icons.remove,
                      onTap: () {
                        setState(() {
                          if (count > 0) count--;
                        });
                      },
                    ),
                    10.horizontalSpace,
                    Text(
                      '$count',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    10.horizontalSpace,
                    _buildIconButton(
                      icon: Icons.add,
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                    ),
                  ],
                ),
                18.verticalSpace,
                CustomTextButton(
                  height: 40.h,
                  width: 120.w,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      count = 0;
                    });
                  },
                  text: 'Remove',
                  backgroundColor: AppColors.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 34.h,
        width: 34.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 18.sp),
      ),
    );
  }
}
