import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';

class CatigoryList extends StatefulWidget {
  const CatigoryList({super.key});

  @override
  State<CatigoryList> createState() => _CatigoryListState();
}

class _CatigoryListState extends State<CatigoryList> {
  final List<String> categories = ['All', 'Combos', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryColor
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4),
                          blurRadius: 4,
                        ),
                      ]
                    : [],
              ),
              child: CoustomText(
                text: categories[index],
                fontSize: 16.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey.shade700,
              ),
            ),
          );
        },
      ),
    );
  }
}
