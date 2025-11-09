import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          if (_isFocused)
            BoxShadow(
              color: primaryColor.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white.withOpacity(0.95),
        elevation: _isFocused ? 6 : 2,
        shadowColor: Colors.black12,
        child: TextField(
          focusNode: _focusNode,
          textInputAction: TextInputAction.search,
          cursorColor: primaryColor,
          style: TextStyle(fontSize: 16.sp, color: Colors.black87),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Icon(
                Icons.search_rounded,
                color: _isFocused ? primaryColor : Colors.grey.shade600,
                size: 26.sp,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
              },
              child: Icon(
                Icons.mic_none_rounded,
                color: Colors.grey.shade500,
                size: 24.sp,
              ),
            ),
            hintText: 'Search for meals, drinks...',
            hintStyle: TextStyle(
              fontSize: 15.sp,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.95),
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 16.w,
            ),
          ),
          onSubmitted: (value) {
            if (value.trim().isEmpty) return;
            HapticFeedback.mediumImpact();
          },
        ),
      ),
    );
  }
}
