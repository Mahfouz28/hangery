import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 4,
      borderRadius: BorderRadius.circular(20.r),
      shadowColor: Colors.black12,
      child: TextField(
        textInputAction: TextInputAction.search,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
          hintText: 'Search food...',
          hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey.shade500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 16.w,
          ),
        ),
        onSubmitted: (value) {
          // TODO: Handle search logic (can trigger Bloc event or navigation)
        },
      ),
    );
  }
}
