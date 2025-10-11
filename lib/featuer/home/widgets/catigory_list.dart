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
  List<String> catigory = ['All', 'Combos', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            catigory.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? AppColors.primaryColor
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: CoustomText(
                    fontWeight: selectedIndex == index
                        ? FontWeight.w600
                        : FontWeight.w500,
                    text: catigory[index],
                    fontSize: 16.sp,
                    color: selectedIndex == index
                        ? Colors.white
                        : Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
